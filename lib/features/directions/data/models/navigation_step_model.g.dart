// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NavigationStepModel _$NavigationStepModelFromJson(Map<String, dynamic> json) =>
    _NavigationStepModel(
      instruction: json['instruction'] as String,
      distance: (json['distance'] as num).toDouble(),
    );

Map<String, dynamic> _$NavigationStepModelToJson(
  _NavigationStepModel instance,
) => <String, dynamic>{
  'instruction': instance.instruction,
  'distance': instance.distance,
};
