import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../providers/navigation_notifier.dart';
import '../providers/navigation_state.dart';
import '../widgets/navigation_steps_panel.dart';
import '../widgets/user_location_marker.dart';

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

  /// Última posición conocida — usada como punto de partida de la animación.
  LatLng? _lastPosition;

  /// Último heading de la brújula (grados desde el norte, sentido horario).
  double _bearing = 0.0;

  /// Controller del panel inferior — permite escuchar cambios de tamaño
  /// directamente, sin depender del bubbling de notificaciones.
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  /// True mientras el panel está en movimiento; bloquea que el desborde
  /// de gestos del panel apague la brújula en el mapa.
  bool _panelMoving = false;
  Timer? _panelMoveTimer;

  StreamSubscription<CompassEvent>? _compassSub;

  @override
  void initState() {
    super.initState();

    // Escucha cambios del panel: mientras se arrastra, bloquea que
    // el desborde de gestos apague la brújula. Al llegar al mínimo
    // (mapa "maximizado") reactiva seguimiento y brújula.
    _sheetController.addListener(_onSheetChanged);

    // Escucha la brújula del dispositivo y rota el mapa en tiempo real.
    _compassSub = FlutterCompass.events?.listen((event) {
      if (event.heading == null || !mounted) return;
      _bearing = event.heading!;
      if (_followUser) {
        // flutter_map rota en sentido horario; negamos el heading para que
        // la dirección del usuario quede siempre apuntando hacia arriba.
        _mapController.rotate(-_bearing);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(navigationNotifierProvider.notifier)
          .startNavigation(placeId: widget.placeId);
    });
  }

  void _onSheetChanged() {
    // Cada vez que el panel cambia de tamaño marcamos que está en movimiento
    // y reiniciamos el timer que lo desmarca 400ms después de que se detenga.
    _panelMoving = true;
    _panelMoveTimer?.cancel();
    _panelMoveTimer = Timer(const Duration(milliseconds: 400), () {
      _panelMoving = false;
    });

    // Cuando el panel llega a su mínimo (mapa "maximizado") reactivamos
    // seguimiento y brújula, igual que al pulsar el botón mi ubicación.
    if (_sheetController.size <= 0.13) {
      final pos = ref.read(navigationNotifierProvider).currentPosition;
      if (pos != null) _toggleFollow(pos);
    }
  }

  @override
  void dispose() {
    _panelMoveTimer?.cancel();
    _sheetController.removeListener(_onSheetChanged);
    _sheetController.dispose();
    _compassSub?.cancel();
    ref.read(navigationNotifierProvider.notifier).stopNavigation();
    super.dispose();
  }

  void _toggleFollow(LatLng currentPosition) {
    setState(() => _followUser = true);
    _mapController.move(currentPosition, _mapController.camera.zoom);
    _mapController.rotate(-_bearing);
  }

  @override
  Widget build(BuildContext context) {
    final navState = ref.watch(navigationNotifierProvider);

    ref.listen(navigationNotifierProvider, (previous, next) {
      if (next.currentPosition == null) return;

      if (!_hasCenteredOnce && next.route != null) {
        _hasCenteredOnce = true;
        setState(() => _lastPosition = next.currentPosition);
        _mapController.move(next.currentPosition!, 18);
      } else if (next.currentPosition != previous?.currentPosition) {
        // Guardamos la posición anterior como punto de inicio de la animación.
        setState(() {
          _lastPosition =
              previous?.currentPosition ?? next.currentPosition;
        });
        if (_followUser) {
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

    // Punto de inicio de la animación: posición anterior si existe,
    // o la posición actual (sin movimiento visible en el primer frame).
    final animFrom = _lastPosition ?? currentPosition;

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: currentPosition,
            initialZoom: 18,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all,
            ),
            onTap: (_, __) {},
            onPositionChanged: (camera, hasGesture) {
              if (hasGesture && _followUser && !_panelMoving) {
                setState(() => _followUser = false);
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
            // Animamos el marcador de usuario desde la posición anterior
            // a la nueva — da la sensación de deslizamiento suave.
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

        if (navState.status == NavigationStatus.arrived) const _ArrivedBanner(),

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

        // El Listener activa _panelMoving en el instante que el dedo
        // toca el panel — incluso cuando el sheet ya está en su límite
        // y rechaza el gesto inmediatamente sin cambiar de tamaño.
        // Esto garantiza que el desborde al mapa siempre quede bloqueado.
        Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: (_) {
            _panelMoving = true;
            _panelMoveTimer?.cancel();
            _panelMoveTimer = Timer(const Duration(milliseconds: 600), () {
              _panelMoving = false;
            });
          },
          child: NavigationStepsPanel(
            route: route,
            status: navState.status,
            sheetController: _sheetController,
          ),
        ),
      ],
    );
  }
}

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
