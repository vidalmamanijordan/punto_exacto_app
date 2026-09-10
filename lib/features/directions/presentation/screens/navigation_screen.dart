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

  /// Cuando es true el mapa sigue al usuario y rota con la brújula.
  bool _followUser = true;

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

  /// Timer para re-activar la brújula tras soltar un gesto de
  /// dos dedos (zoom / rotación). Se cancela si el usuario hace
  /// un deslizamiento con un dedo (alejándose intencionalmente).
  Timer? _gestureResumeTimer;

  StreamSubscription<CompassEvent>? _compassSub;

  @override
  void initState() {
    super.initState();

    _sheetController.addListener(_onSheetChanged);

    _compassSub = FlutterCompass.events?.listen((event) {
      if (event.heading == null || !mounted) return;
      _bearingNotifier.value = event.heading!;
      if (_followUser) {
        _mapController.rotate(-event.heading!);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(navigationNotifierProvider.notifier)
          .startNavigation(placeId: widget.placeId);
    });
  }

  /// Llamado en cada cambio de tamaño del panel.
  /// Cuando el panel deja de moverse (350 ms sin cambios), reactiva
  /// la brújula y el seguimiento — tanto si el panel quedó en su
  /// mínimo (mapa grande) como en su máximo (panel grande).
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

  /// Activa seguimiento GPS + brújula y centra el mapa a zoom 18.
  /// Usar solo para el botón "mi ubicación" (re-centrado explícito).
  void _toggleFollow(LatLng currentPosition) {
    setState(() => _followUser = true);
    _mapController.move(currentPosition, _kNavZoom);
    _mapController.rotate(-_bearingNotifier.value);
  }

  /// Re-activa la brújula y el seguimiento GPS SIN cambiar el zoom
  /// ni re-centrar el mapa. Se usa tras gestos de dos dedos o al
  /// mover el panel, para que el usuario no pierda el nivel de zoom
  /// que eligió al hacer pinch.
  void _resumeCompass() {
    if (!mounted) return;
    setState(() => _followUser = true);
    _mapController.rotate(-_bearingNotifier.value);
  }

  /// Resetea la rotación a norte arriba y desactiva la auto-rotación.
  void _resetNorth() {
    setState(() => _followUser = false);
    _mapController.rotate(0);
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
        if (_followUser) {
          // Preserva el zoom que el usuario eligió; solo mueve la posición.
          _mapController.move(
            next.currentPosition!,
            _mapController.camera.zoom,
          );
        }
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

              // ── Pausar brújula al inicio de cualquier gesto ──────────────
              if (_followUser &&
                  (src == MapEventSource.multiFingerGestureStart ||
                      src == MapEventSource.onMultiFinger ||
                      src == MapEventSource.dragStart ||
                      src == MapEventSource.onDrag)) {
                _followUser = false;
                setState(() {});
              }

              // ── Dos dedos: re-activar brújula 800 ms tras soltar ─────────
              // Cada evento de dos dedos reinicia el timer; cuando el
              // usuario levanta los dedos el timer ya no se resetea y
              // 800 ms después la brújula vuelve sola SIN cambiar zoom.
              if (src == MapEventSource.multiFingerGestureStart ||
                  src == MapEventSource.onMultiFinger) {
                _gestureResumeTimer?.cancel();
                _gestureResumeTimer = Timer(
                  const Duration(milliseconds: 800),
                  _resumeCompass,
                );
              }

              // ── Un dedo (pan): cancela la re-activación pendiente ────────
              // El usuario se alejó intencionalmente; la brújula queda
              // desactivada hasta que pulse el botón o mueva el panel.
              if (src == MapEventSource.dragStart) {
                _gestureResumeTimer?.cancel();
              }
            },
            // Respaldo para gestos no capturados por onMapEvent.
            onPositionChanged: (camera, hasGesture) {
              if (hasGesture && _followUser) {
                _followUser = false;
                setState(() {});
              }
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.upeu.puntoexacto.punto_exacto_app',
            ),
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
        Positioned(
          top: 16,
          right: 16,
          child: ValueListenableBuilder<double>(
            valueListenable: _bearingNotifier,
            builder: (context, bearing, _) {
              return GestureDetector(
                onTap: _resetNorth,
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
                    angle: bearing * math.pi / 180,
                    child: const Icon(
                      Icons.navigation,
                      color: Colors.red,
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
            backgroundColor: _followUser
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surface,
            onPressed: () => _toggleFollow(currentPosition),
            child: Icon(
              Icons.my_location,
              color: _followUser
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
