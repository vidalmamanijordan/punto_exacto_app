import '../../data/models/directions_response.dart';

abstract class DirectionsRepository {
  Future<DirectionsResponse> getDirections({
    required double originLat,
    required double originLng,
    required int placeId,
  });
}
