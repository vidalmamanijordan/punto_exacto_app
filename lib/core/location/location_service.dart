import 'package:geolocator/geolocator.dart';

/// Resultado de intentar obtener la ubicación del usuario.
sealed class LocationResult {}

class LocationSuccess extends LocationResult {
  final double latitude;
  final double longitude;

  LocationSuccess(this.latitude, this.longitude);
}

class LocationDenied extends LocationResult {}

class LocationServiceDisabled extends LocationResult {}

class LocationError extends LocationResult {
  final String message;
  LocationError(this.message);
}

class LocationService {
  /// Solicita permiso y obtiene la ubicación actual del dispositivo.
  Future<LocationResult> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return LocationServiceDisabled();
    }

    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return LocationDenied();
    }

    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
        ),
      );

      return LocationSuccess(position.latitude, position.longitude);
    } catch (e) {
      return LocationError('No se pudo obtener tu ubicación.');
    }
  }
}
