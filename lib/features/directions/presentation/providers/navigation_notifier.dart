import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/utils/geo_utils.dart';
import 'directions_providers.dart';
import 'navigation_state.dart';

class NavigationNotifier extends Notifier<NavigationState> {
  StreamSubscription<Position>? _positionSubscription;

  @override
  NavigationState build() {
    // Cuando el provider se destruye (el usuario sale de la
    // pantalla de navegación), cancelamos el stream de GPS
    // para no seguir consumiendo batería en segundo plano.
    ref.onDispose(() {
      _positionSubscription?.cancel();
    });

    return const NavigationState();
  }

  /// Inicia el flujo completo: obtiene la ubicación actual,
  /// pide la ruta al backend, y comienza a seguir al usuario
  /// en vivo mientras camina.
  Future<void> startNavigation({required int placeId}) async {
    state = state.copyWith(
      status: NavigationStatus.loadingRoute,
      clearError: true,
    );

    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      final repository = ref.read(directionsRepositoryProvider);

      final response = await repository.getDirections(
        originLat: position.latitude,
        originLng: position.longitude,
        placeId: placeId,
      );

      if (!response.success || response.data == null) {
        state = state.copyWith(
          status: NavigationStatus.error,
          errorMessage: response.message,
        );
        return;
      }

      state = state.copyWith(
        status: NavigationStatus.navigating,
        route: response.data,
        currentPosition: LatLng(position.latitude, position.longitude),
      );

      _startTrackingPosition();
    } on ApiException catch (e) {
      state = state.copyWith(
        status: NavigationStatus.error,
        errorMessage: e.message,
      );
    } catch (e) {
      state = state.copyWith(
        status: NavigationStatus.error,
        errorMessage: 'No se pudo obtener tu ubicación.',
      );
    }
  }

  /// Escucha la posición del usuario en vivo, actualizando el
  /// mapa y verificando si ya llegó a su destino.
  void _startTrackingPosition() {
    _positionSubscription?.cancel();

    _positionSubscription =
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 1, // solo notifica si se movió 3+ metros
          ),
        ).listen((position) {
          final newPosition = LatLng(position.latitude, position.longitude);

          state = state.copyWith(currentPosition: newPosition);

          _checkArrival(newPosition);
        });
  }

  /// Compara la posición actual contra el waypoint de destino;
  /// si está dentro del umbral configurado, marca como "llegó".
  void _checkArrival(LatLng currentPosition) {
    final route = state.route;
    if (route == null || state.status == NavigationStatus.arrived) return;

    final destination = route.waypoints.last;

    final distance = distanceInMeters(
      currentPosition.latitude,
      currentPosition.longitude,
      double.parse(destination.latitude),
      double.parse(destination.longitude),
    );

    if (distance <= AppConfig.arrivalThresholdMeters) {
      state = state.copyWith(status: NavigationStatus.arrived);
      _positionSubscription?.cancel();
    }
  }

  /// Reinicia todo el estado (al salir de la pantalla o cancelar).
  void stopNavigation() {
    _positionSubscription?.cancel();
    state = const NavigationState();
  }
}

final navigationNotifierProvider =
    NotifierProvider<NavigationNotifier, NavigationState>(
      NavigationNotifier.new,
    );
