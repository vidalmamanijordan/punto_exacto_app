// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_waypoint_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RouteWaypointModel _$RouteWaypointModelFromJson(Map<String, dynamic> json) =>
    _RouteWaypointModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$RouteWaypointModelToJson(_RouteWaypointModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
