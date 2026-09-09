// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) => _PlaceModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  building: json['building'] as String?,
  floor: json['floor'] as String?,
  room: json['room'] as String?,
  image: json['image'] as String?,
  latitude: json['latitude'] as String?,
  longitude: json['longitude'] as String?,
);

Map<String, dynamic> _$PlaceModelToJson(_PlaceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'building': instance.building,
      'floor': instance.floor,
      'room': instance.room,
      'image': instance.image,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
