import 'package:flutter/animation.dart';
import 'package:latlong2/latlong.dart';

/// Permite animar suavemente entre dos coordenadas geográficas,
/// para que el marcador del usuario se deslice en vez de saltar
/// cada vez que llega una nueva posición del GPS.
class LatLngTween extends Tween<LatLng> {
  LatLngTween({required LatLng super.begin, required LatLng super.end});

  @override
  LatLng lerp(double t) {
    final b = begin!;
    final e = end!;

    return LatLng(
      b.latitude + (e.latitude - b.latitude) * t,
      b.longitude + (e.longitude - b.longitude) * t,
    );
  }
}
