import 'package:latlong2/latlong.dart';

import '../../data/models/directions_response.dart';

enum NavigationStatus { idle, loadingRoute, navigating, arrived, error }

class NavigationState {
  final NavigationStatus status;
  final DirectionsData? route;
  final LatLng? currentPosition;
  final String? errorMessage;

  const NavigationState({
    this.status = NavigationStatus.idle,
    this.route,
    this.currentPosition,
    this.errorMessage,
  });

  NavigationState copyWith({
    NavigationStatus? status,
    DirectionsData? route,
    LatLng? currentPosition,
    String? errorMessage,
    bool clearError = false,
  }) {
    return NavigationState(
      status: status ?? this.status,
      route: route ?? this.route,
      currentPosition: currentPosition ?? this.currentPosition,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
