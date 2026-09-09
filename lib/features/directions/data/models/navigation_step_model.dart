import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_step_model.freezed.dart';
part 'navigation_step_model.g.dart';

@freezed
abstract class NavigationStepModel with _$NavigationStepModel {
  const factory NavigationStepModel({
    required String instruction,
    required double distance,
  }) = _NavigationStepModel;

  factory NavigationStepModel.fromJson(Map<String, dynamic> json) =>
      _$NavigationStepModelFromJson(json);
}
