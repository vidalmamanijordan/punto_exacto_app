import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/location/location_service.dart';
import '../../../../core/utils/geo_utils.dart';
import '../../data/models/campus_model.dart';
import 'campus_providers.dart';

/// Estado de la detección automática de campus.
sealed class CampusDetectionState {}

class CampusDetectionLoading extends CampusDetectionState {}

class CampusDetectionSuccess extends CampusDetectionState {
  final CampusModel campus;
  CampusDetectionSuccess(this.campus);
}

class CampusDetectionFailed extends CampusDetectionState {
  final String reason;
  CampusDetectionFailed(this.reason);
}

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

final campusDetectionProvider = FutureProvider<CampusDetectionState>((
  ref,
) async {
  final locationService = ref.watch(locationServiceProvider);
  final campuses = await ref.watch(campusListProvider.future);

  if (campuses.isEmpty) {
    return CampusDetectionFailed('No hay campus registrados.');
  }

  final result = await locationService.getCurrentLocation();

  switch (result) {
    case LocationSuccess(:final latitude, :final longitude):
      final nearest = _findNearestCampus(campuses, latitude, longitude);
      return CampusDetectionSuccess(nearest);

    case LocationDenied():
      return CampusDetectionFailed('Permiso de ubicación denegado.');

    case LocationServiceDisabled():
      return CampusDetectionFailed('El GPS está desactivado.');

    case LocationError(:final message):
      return CampusDetectionFailed(message);
  }
});

CampusModel _findNearestCampus(
  List<CampusModel> campuses,
  double latitude,
  double longitude,
) {
  CampusModel nearest = campuses.first;
  double shortestDistance = distanceInMeters(
    latitude,
    longitude,
    nearest.latitude,
    nearest.longitude,
  );

  for (final campus in campuses.skip(1)) {
    final distance = distanceInMeters(
      latitude,
      longitude,
      campus.latitude,
      campus.longitude,
    );

    if (distance < shortestDistance) {
      shortestDistance = distance;
      nearest = campus;
    }
  }

  return nearest;
}
