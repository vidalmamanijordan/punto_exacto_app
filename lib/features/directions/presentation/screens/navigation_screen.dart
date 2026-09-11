import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../providers/navigation_notifier.dart';
import '../providers/navigation_state.dart';
import '../widgets/navigation_steps_panel.dart';
import '../widgets/user_location_marker.dart';

/// Zoom predeterminado para navegación a pie.
const double _kNavZoom = 18.0;

class NavigationScreen extends ConsumerStatefulWidget {
  final int placeId;
  final String placeName;

  const NavigationScreen({
    super.key,
    required this.placeId,
    required this.placeName,
  });

  @override
  ConsumerState<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends ConsumerState<NavigationScreen> {
  final MapController _mapController = MapController();
  bool _hasCenteredOnce = false;

  /// El mapa rota según la brújula del dispositivo.
  bool _followBearing = true;

  /// Offset de rotación elegido por el usuario con dos dedos (grados).
  /// Permite que la brújula siga activa pero desde el ángulo preferido.
  /// Fórmula: rotación_mapa = -compass_heading + _rotationOffset
  double _rotationOffset = 0.0;

  /// Última posición conocida — punto de partida de la animación del marcador.
  LatLng? _lastPosition;

  /// Heading actual del dispositivo (0-360°, desde el norte magnético).
  /// ValueNotifier para que solo el icono de la brújula se reconstruya.
  final ValueNotifier<double> _bearingNotifier = ValueNotifier(0.0);

  /// Controller del panel inferior.
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  /// Timer para detectar el fin del arrastre del panel.
  Timer? _sheetSettleTimer;

  /// Timer para re-activar la brújula 300 ms después de soltar
  /// un gesto de dos dedos (zoom/rotación).
  Timer? _gestureResumeTimer;

  StreamSubscription<CompassEvent>? _compassSub;

  @override
  void initState() {
    super.initState();

    _sheetController.addListener(_onSheetChanged);

    _compassSub = FlutterCompass.events?.listen((event) {
      if (event.heading == null || !mounted) return;
      _bearingNotifier.value = event.heading!;
      if (_followBearing) {
        _mapController.rotate(-event.heading! + _rotationOffset);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(navigationNotifierProvider.notifier)
          .startNavigation(placeId: widget.placeId);
    });
  }

  /// Cuando el panel deja de moverse (350 ms sin cambios), reactiva la brújula.
  void _onSheetChanged() {
    _sheetSettleTimer?.cancel();
    _sheetSettleTimer = Timer(const Duration(milliseconds: 350), () {
      _resumeCompass();
    });
  }

  @override
  void dispose() {
    _sheetSettleTimer?.cancel();
    _gestureResumeTimer?.cancel();
    _sheetController.removeListener(_onSheetChanged);
    _sheetController.dispose();
    _compassSub?.cancel();
    _bearingNotifier.dispose();
    ref.read(navigationNotifierProvider.notifier).stopNavigation();
    super.dispose();
  }

  /// Botón "mi ubicación": resetea offset, reactiva brújula pura, re-centra.
  void _toggleFollow(LatLng currentPosition) {
    _rotationOffset = 0.0;
    setState(() => _followBearing = true);
    _mapController.move(currentPosition, _kNavZoom);
    _mapController.rotate(-_bearingNotifier.value);
  }

  /// Reactiva la brújula preservando el ángulo que el usuario eligió.
  /// Captura el offset entre la rotación actual del mapa y el heading
  /// de la brújula, para que el mapa siga girando desde esa posición.
  void _resumeCompass() {
    if (!mounted) return;
    // offset = rotación_actual - lo_que_la_brújula_hubiera_puesto
    _rotationOffset =
        _mapController.camera.rotation - (-_bearingNotifier.value);
    setState(() => _followBearing = true);
    _mapController.rotate(-_bearingNotifier.value + _rotationOffset);
  }

  /// Botón brújula: alterna entre heading-up y norte-arriba.
  void _toggleNorth() {
    if (_followBearing) {
      // Heading-up → Norte arriba
      _rotationOffset = 0.0;
      setState(() => _followBearing = false);
      _mapController.rotate(0);
    } else {
      // Norte arriba → Heading-up
      _rotationOffset = 0.0;
      setState(() => _followBearing = true);
      _mapController.rotate(-_bearingNotifier.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final navState = ref.watch(navigationNotifierProvider);

    ref.listen(navigationNotifierProvider, (previous, next) {
      if (next.currentPosition == null) return;

      if (!_hasCenteredOnce && next.route != null) {
        _hasCenteredOnce = true;
        setState(() => _lastPosition = next.currentPosition);
        _mapController.move(next.currentPosition!, _kNavZoom);
      } else if (next.currentPosition != previous?.currentPosition) {
        setState(() {
          _lastPosition = previous?.currentPosition ?? next.currentPosition;
        });
        // El mapa SIEMPRE sigue la posición GPS; preserva el zoom del usuario.
        _mapController.move(next.currentPosition!, _mapController.camera.zoom);
      }

      if (next.status == NavigationStatus.arrived &&
          previous?.status != NavigationStatus.arrived) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('¡Has llegado a ${widget.placeName}!')),
        );
      }

      if (next.status == NavigationStatus.error &&
          next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(widget.placeName)),
      body: switch (navState.status) {
        NavigationStatus.idle || NavigationStatus.loadingRoute => const Center(
          child: CircularProgressIndicator(),
        ),
        NavigationStatus.error => _ErrorView(
          message: navState.errorMessage ?? 'Ocurrió un error inesperado.',
          onRetry: () => ref
              .read(navigationNotifierProvider.notifier)
              .startNavigation(placeId: widget.placeId),
        ),
        NavigationStatus.navigating ||
        NavigationStatus.arrived => _buildMap(navState),
      },
    );
  }

  Widget _buildMap(NavigationState navState) {
    final route = navState.route!;
    final currentPosition = navState.currentPosition!;

    final routePoints = route.waypoints
        .map((w) => LatLng(double.parse(w.latitude), double.parse(w.longitude)))
        .toList();

    final destination = routePoints.last;
    final animFrom = _lastPosition ?? currentPosition;

    return Stack(
      children: [
        // ── Mapa ────────────────────────────────────────────────────────────
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: currentPosition,
            initialZoom: _kNavZoom,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all,
              // Zoom y rotación se reconocen simultáneamente.
              enableMultiFingerGestureRace: true,
              // Umbrales bajos para respuesta inmediata en Huawei/HiTouch.
              rotationThreshold: 5.0,
              pinchZoomThreshold: 0.2,
              pinchMoveThreshold: 20.0,
            ),
            onTap: (tapPos, latLng) {},
            onMapEvent: (event) {
              final src = event.source;

              // ── Dos dedos (zoom / rotación) ──────────────────────────────
              // Pausa la brújula durante el gesto y la reactiva 300 ms
              // después de soltar — modo heading-up siempre activo.
              if (src == MapEventSource.multiFingerGestureStart ||
                  src == MapEventSource.onMultiFinger) {
                if (_followBearing) setState(() => _followBearing = false);
                _gestureResumeTimer?.cancel();
                _gestureResumeTimer = Timer(
                  const Duration(milliseconds: 300),
                  _resumeCompass,
                );
              }

              // ── Un dedo (pan) ────────────────────────────────────────────
              // La brújula sigue activa; el GPS devuelve el mapa a tu
              // posición en la próxima actualización.
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.upeu.puntoexacto.punto_exacto_app',
            ),
            // Solo dibuja la ruta azul si el backend devolvió pasos reales.
            // Sin pasos = fallback de línea recta = solo se muestran marcadores.
            if (route.steps.isNotEmpty)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: routePoints,
                    strokeWidth: 5,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            TweenAnimationBuilder<LatLng>(
              key: ValueKey(
                '${currentPosition.latitude}_${currentPosition.longitude}',
              ),
              tween: LatLngTween(begin: animFrom, end: currentPosition),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              builder: (context, animatedPosition, _) {
                return MarkerLayer(
                  markers: [
                    Marker(
                      point: animatedPosition,
                      width: 30,
                      height: 30,
                      rotate: true,
                      child: const UserLocationMarker(),
                    ),
                    Marker(
                      point: destination,
                      width: 130,
                      height: 72,
                      rotate: true,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Text(
                              widget.placeName,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 36,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),

        // ── Banner llegada ───────────────────────────────────────────────────
        if (navState.status == NavigationStatus.arrived) const _ArrivedBanner(),

        // ── Botón brújula (esquina superior derecha) ─────────────────────────
        // Heading-up: ícono rota con el bearing, color rojo (activo).
        // Norte-arriba: ícono fijo apuntando al norte, color gris (inactivo).
        Positioned(
          top: 16,
          right: 16,
          child: ValueListenableBuilder<double>(
            valueListenable: _bearingNotifier,
            builder: (context, bearing, _) {
              final isHeadingUp = _followBearing;
              return GestureDetector(
                onTap: _toggleNorth,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Transform.rotate(
                    // En heading-up rota con el bearing; en norte-arriba queda fijo.
                    angle: isHeadingUp ? bearing * math.pi / 180 : 0.0,
                    child: Icon(
                      Icons.navigation,
                      color: isHeadingUp ? Colors.red : Colors.grey,
                      size: 24,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // ── Botón mi ubicación ───────────────────────────────────────────────
        Positioned(
          right: 16,
          bottom: 220,
          child: FloatingActionButton(
            mini: true,
            backgroundColor: _followBearing
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surface,
            onPressed: () => _toggleFollow(currentPosition),
            child: Icon(
              Icons.my_location,
              color: _followBearing
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),

        // ── Panel de pasos ───────────────────────────────────────────────────
        NavigationStepsPanel(
          route: route,
          status: navState.status,
          sheetController: _sheetController,
        ),
      ],
    );
  }
}

// ── Widgets auxiliares ───────────────────────────────────────────────────────

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.grey),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: const Text('Reintentar')),
          ],
        ),
      ),
    );
  }
}

class _ArrivedBanner extends StatelessWidget {
  const _ArrivedBanner();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text(
                '¡Has llegado a tu destino!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
