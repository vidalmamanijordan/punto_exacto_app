import 'dart:math';

/// Calcula la distancia en metros entre dos coordenadas
/// usando la fórmula de Haversine — la misma que usa el
/// backend en GeoService.php, para mantener consistencia.
double distanceInMeters(double lat1, double lng1, double lat2, double lng2) {
  const earthRadius = 6371000.0;

  final latDelta = _degToRad(lat2 - lat1);
  final lngDelta = _degToRad(lng2 - lng1);

  final a =
      sin(latDelta / 2) * sin(latDelta / 2) +
      cos(_degToRad(lat1)) *
          cos(_degToRad(lat2)) *
          sin(lngDelta / 2) *
          sin(lngDelta / 2);

  final c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return earthRadius * c;
}

double _degToRad(double deg) => deg * (pi / 180);
