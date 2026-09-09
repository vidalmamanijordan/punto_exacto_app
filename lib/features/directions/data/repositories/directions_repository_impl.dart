import '../../domain/repositories/directions_repository.dart';
import '../datasources/directions_remote_datasource.dart';
import '../models/directions_response.dart';

class DirectionsRepositoryImpl implements DirectionsRepository {
  final DirectionsRemoteDataSource _remoteDataSource;

  DirectionsRepositoryImpl(this._remoteDataSource);

  @override
  Future<DirectionsResponse> getDirections({
    required double originLat,
    required double originLng,
    required int placeId,
  }) {
    return _remoteDataSource.getDirections(
      originLat: originLat,
      originLng: originLng,
      placeId: placeId,
    );
  }
}
