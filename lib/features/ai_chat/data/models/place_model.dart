import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

@freezed
abstract class PlaceModel with _$PlaceModel {
  const factory PlaceModel({
    required int id,
    required String name,
    String? description,
    String? building,
    String? floor,
    String? room,
    String? image,
    String? latitude,
    String? longitude,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);
}
