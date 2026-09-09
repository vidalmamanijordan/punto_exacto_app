// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_waypoint_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteWaypointModel {

 int get id; String? get name; String get latitude; String get longitude;
/// Create a copy of RouteWaypointModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteWaypointModelCopyWith<RouteWaypointModel> get copyWith => _$RouteWaypointModelCopyWithImpl<RouteWaypointModel>(this as RouteWaypointModel, _$identity);

  /// Serializes this RouteWaypointModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RouteWaypointModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteWaypointModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RouteWaypointModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.latitude,_this.longitude);
}

@override
String toString() {
  final _this = this as RouteWaypointModel;
  return 'RouteWaypointModel(id: ${_this.id}, name: ${_this.name}, latitude: ${_this.latitude}, longitude: ${_this.longitude})';
}


}

/// @nodoc
abstract mixin class $RouteWaypointModelCopyWith<$Res>  {
  factory $RouteWaypointModelCopyWith(RouteWaypointModel value, $Res Function(RouteWaypointModel) _then) = _$RouteWaypointModelCopyWithImpl;
@useResult
$Res call({
 int id, String? name, String latitude, String longitude
});




}
/// @nodoc
class _$RouteWaypointModelCopyWithImpl<$Res>
    implements $RouteWaypointModelCopyWith<$Res> {
  _$RouteWaypointModelCopyWithImpl(this._self, this._then);

  final RouteWaypointModel _self;
  final $Res Function(RouteWaypointModel) _then;

/// Create a copy of RouteWaypointModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? latitude = null,Object? longitude = null,}) {
  return _then(RouteWaypointModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteWaypointModel].
extension RouteWaypointModelPatterns on RouteWaypointModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteWaypointModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteWaypointModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteWaypointModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteWaypointModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteWaypointModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteWaypointModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? name,  String latitude,  String longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteWaypointModel() when $default != null:
return $default(_that.id,_that.name,_that.latitude,_that.longitude);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? name,  String latitude,  String longitude)  $default,) {final _that = this;
switch (_that) {
case _RouteWaypointModel():
return $default(_that.id,_that.name,_that.latitude,_that.longitude);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? name,  String latitude,  String longitude)?  $default,) {final _that = this;
switch (_that) {
case _RouteWaypointModel() when $default != null:
return $default(_that.id,_that.name,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteWaypointModel implements RouteWaypointModel {
  const _RouteWaypointModel({required this.id, this.name, required this.latitude, required this.longitude});
  factory _RouteWaypointModel.fromJson(Map<String, dynamic> json) => _$RouteWaypointModelFromJson(json);

@override final  int id;
@override final  String? name;
@override final  String latitude;
@override final  String longitude;

/// Create a copy of RouteWaypointModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteWaypointModelCopyWith<_RouteWaypointModel> get copyWith => __$RouteWaypointModelCopyWithImpl<_RouteWaypointModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteWaypointModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteWaypointModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,latitude,longitude);
}

@override
String toString() {
    return 'RouteWaypointModel(id: $id, name: $name, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$RouteWaypointModelCopyWith<$Res> implements $RouteWaypointModelCopyWith<$Res> {
  factory _$RouteWaypointModelCopyWith(_RouteWaypointModel value, $Res Function(_RouteWaypointModel) _then) = __$RouteWaypointModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String? name, String latitude, String longitude
});




}
/// @nodoc
class __$RouteWaypointModelCopyWithImpl<$Res>
    implements _$RouteWaypointModelCopyWith<$Res> {
  __$RouteWaypointModelCopyWithImpl(this._self, this._then);

  final _RouteWaypointModel _self;
  final $Res Function(_RouteWaypointModel) _then;

/// Create a copy of RouteWaypointModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? latitude = null,Object? longitude = null,}) {
  return _then(_RouteWaypointModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
