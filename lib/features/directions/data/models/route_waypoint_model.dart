import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_waypoint_model.freezed.dart';
part 'route_waypoint_model.g.dart';

@freezed
abstract class RouteWaypointModel with _$RouteWaypointModel {
  const factory RouteWaypointModel({
    required int id,
    String? name,
    required String latitude,
    required String longitude,
  }) = _RouteWaypointModel;

  factory RouteWaypointModel.fromJson(Map<String, dynamic> json) =>
      _$RouteWaypointModelFromJson(json);
}
