import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../ai_chat/data/models/place_model.dart';
import 'navigation_step_model.dart';
import 'route_waypoint_model.dart';

part 'directions_response.freezed.dart';
part 'directions_response.g.dart';

@freezed
abstract class DirectionsResponse with _$DirectionsResponse {
  const factory DirectionsResponse({
    required bool success,
    required String message,
    DirectionsData? data,
  }) = _DirectionsResponse;

  factory DirectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectionsResponseFromJson(json);
}

@freezed
abstract class DirectionsData with _$DirectionsData {
  const factory DirectionsData({
    required PlaceModel place,

    @JsonKey(name: 'distance_meters') required double distanceMeters,

    @JsonKey(name: 'duration_minutes') required double durationMinutes,

    @JsonKey(name: 'origin_waypoint')
    required RouteWaypointModel originWaypoint,

    required List<RouteWaypointModel> waypoints,

    @Default([]) List<NavigationStepModel> steps,
  }) = _DirectionsData;

  factory DirectionsData.fromJson(Map<String, dynamic> json) =>
      _$DirectionsDataFromJson(json);
}
