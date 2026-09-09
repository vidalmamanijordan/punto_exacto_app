// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DirectionsResponse _$DirectionsResponseFromJson(Map<String, dynamic> json) =>
    _DirectionsResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : DirectionsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DirectionsResponseToJson(_DirectionsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_DirectionsData _$DirectionsDataFromJson(Map<String, dynamic> json) =>
    _DirectionsData(
      place: PlaceModel.fromJson(json['place'] as Map<String, dynamic>),
      distanceMeters: (json['distance_meters'] as num).toDouble(),
      durationMinutes: (json['duration_minutes'] as num).toDouble(),
      originWaypoint: RouteWaypointModel.fromJson(
        json['origin_waypoint'] as Map<String, dynamic>,
      ),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map((e) => RouteWaypointModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps:
          (json['steps'] as List<dynamic>?)
              ?.map(
                (e) => NavigationStepModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DirectionsDataToJson(_DirectionsData instance) =>
    <String, dynamic>{
      'place': instance.place,
      'distance_meters': instance.distanceMeters,
      'duration_minutes': instance.durationMinutes,
      'origin_waypoint': instance.originWaypoint,
      'waypoints': instance.waypoints,
      'steps': instance.steps,
    };
