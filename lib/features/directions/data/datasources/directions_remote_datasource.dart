import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../models/directions_response.dart';

/// Responsable únicamente de la llamada HTTP cruda a /api/directions.
class DirectionsRemoteDataSource {
  final ApiClient _apiClient;

  DirectionsRemoteDataSource(this._apiClient);

  Future<DirectionsResponse> getDirections({
    required double originLat,
    required double originLng,
    required int placeId,
  }) async {
    try {
      final response = await _apiClient.dio.post(
        '/directions',
        data: {
          'origin_lat': originLat,
          'origin_lng': originLng,
          'place_id': placeId,
        },
      );

      return DirectionsResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _apiClient.handleError(e);
    }
  }
}
