// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'directions_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DirectionsResponse {

 bool get success; String get message; DirectionsData? get data;
/// Create a copy of DirectionsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DirectionsResponseCopyWith<DirectionsResponse> get copyWith => _$DirectionsResponseCopyWithImpl<DirectionsResponse>(this as DirectionsResponse, _$identity);

  /// Serializes this DirectionsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DirectionsResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DirectionsResponse&&(identical(other.success, _this.success) || other.success == _this.success)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.data, _this.data) || other.data == _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DirectionsResponse;
  return Object.hash(runtimeType,_this.success,_this.message,_this.data);
}

@override
String toString() {
  final _this = this as DirectionsResponse;
  return 'DirectionsResponse(success: ${_this.success}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $DirectionsResponseCopyWith<$Res>  {
  factory $DirectionsResponseCopyWith(DirectionsResponse value, $Res Function(DirectionsResponse) _then) = _$DirectionsResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, DirectionsData? data
});


$DirectionsDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$DirectionsResponseCopyWithImpl<$Res>
    implements $DirectionsResponseCopyWith<$Res> {
  _$DirectionsResponseCopyWithImpl(this._self, this._then);

  final DirectionsResponse _self;
  final $Res Function(DirectionsResponse) _then;

/// Create a copy of DirectionsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(DirectionsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DirectionsData?,
  ));
}
/// Create a copy of DirectionsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DirectionsDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DirectionsDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [DirectionsResponse].
extension DirectionsResponsePatterns on DirectionsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DirectionsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DirectionsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DirectionsResponse value)  $default,){
final _that = this;
switch (_that) {
case _DirectionsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DirectionsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DirectionsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  DirectionsData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DirectionsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  DirectionsData? data)  $default,) {final _that = this;
switch (_that) {
case _DirectionsResponse():
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  DirectionsData? data)?  $default,) {final _that = this;
switch (_that) {
case _DirectionsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DirectionsResponse implements DirectionsResponse {
  const _DirectionsResponse({required this.success, required this.message, this.data});
  factory _DirectionsResponse.fromJson(Map<String, dynamic> json) => _$DirectionsResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  DirectionsData? data;

/// Create a copy of DirectionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DirectionsResponseCopyWith<_DirectionsResponse> get copyWith => __$DirectionsResponseCopyWithImpl<_DirectionsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DirectionsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DirectionsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,success,message,data);
}

@override
String toString() {
    return 'DirectionsResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DirectionsResponseCopyWith<$Res> implements $DirectionsResponseCopyWith<$Res> {
  factory _$DirectionsResponseCopyWith(_DirectionsResponse value, $Res Function(_DirectionsResponse) _then) = __$DirectionsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, DirectionsData? data
});


@override $DirectionsDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$DirectionsResponseCopyWithImpl<$Res>
    implements _$DirectionsResponseCopyWith<$Res> {
  __$DirectionsResponseCopyWithImpl(this._self, this._then);

  final _DirectionsResponse _self;
  final $Res Function(_DirectionsResponse) _then;

/// Create a copy of DirectionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_DirectionsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DirectionsData?,
  ));
}

/// Create a copy of DirectionsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DirectionsDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DirectionsDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$DirectionsData {

 PlaceModel get place;@JsonKey(name: 'distance_meters') double get distanceMeters;@JsonKey(name: 'duration_minutes') double get durationMinutes;@JsonKey(name: 'origin_waypoint') RouteWaypointModel get originWaypoint; List<RouteWaypointModel> get waypoints; List<NavigationStepModel> get steps;
/// Create a copy of DirectionsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DirectionsDataCopyWith<DirectionsData> get copyWith => _$DirectionsDataCopyWithImpl<DirectionsData>(this as DirectionsData, _$identity);

  /// Serializes this DirectionsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DirectionsData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DirectionsData&&(identical(other.place, _this.place) || other.place == _this.place)&&(identical(other.distanceMeters, _this.distanceMeters) || other.distanceMeters == _this.distanceMeters)&&(identical(other.durationMinutes, _this.durationMinutes) || other.durationMinutes == _this.durationMinutes)&&(identical(other.originWaypoint, _this.originWaypoint) || other.originWaypoint == _this.originWaypoint)&&const DeepCollectionEquality().equals(other.waypoints, _this.waypoints)&&const DeepCollectionEquality().equals(other.steps, _this.steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DirectionsData;
  return Object.hash(runtimeType,_this.place,_this.distanceMeters,_this.durationMinutes,_this.originWaypoint,const DeepCollectionEquality().hash(_this.waypoints),const DeepCollectionEquality().hash(_this.steps));
}

@override
String toString() {
  final _this = this as DirectionsData;
  return 'DirectionsData(place: ${_this.place}, distanceMeters: ${_this.distanceMeters}, durationMinutes: ${_this.durationMinutes}, originWaypoint: ${_this.originWaypoint}, waypoints: ${_this.waypoints}, steps: ${_this.steps})';
}


}

/// @nodoc
abstract mixin class $DirectionsDataCopyWith<$Res>  {
  factory $DirectionsDataCopyWith(DirectionsData value, $Res Function(DirectionsData) _then) = _$DirectionsDataCopyWithImpl;
@useResult
$Res call({
 PlaceModel place,@JsonKey(name: 'distance_meters') double distanceMeters,@JsonKey(name: 'duration_minutes') double durationMinutes,@JsonKey(name: 'origin_waypoint') RouteWaypointModel originWaypoint, List<RouteWaypointModel> waypoints, List<NavigationStepModel> steps
});


$PlaceModelCopyWith<$Res> get place;$RouteWaypointModelCopyWith<$Res> get originWaypoint;

}
/// @nodoc
class _$DirectionsDataCopyWithImpl<$Res>
    implements $DirectionsDataCopyWith<$Res> {
  _$DirectionsDataCopyWithImpl(this._self, this._then);

  final DirectionsData _self;
  final $Res Function(DirectionsData) _then;

/// Create a copy of DirectionsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? place = null,Object? distanceMeters = null,Object? durationMinutes = null,Object? originWaypoint = null,Object? waypoints = null,Object? steps = null,}) {
  return _then(DirectionsData(
place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as PlaceModel,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as double,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as double,originWaypoint: null == originWaypoint ? _self.originWaypoint : originWaypoint // ignore: cast_nullable_to_non_nullable
as RouteWaypointModel,waypoints: null == waypoints ? _self.waypoints : waypoints // ignore: cast_nullable_to_non_nullable
as List<RouteWaypointModel>,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<NavigationStepModel>,
  ));
}
/// Create a copy of DirectionsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceModelCopyWith<$Res> get place {
  
  return $PlaceModelCopyWith<$Res>(_self.place, (value) {
    return _then(_self.copyWith(place: value));
  });
}/// Create a copy of DirectionsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteWaypointModelCopyWith<$Res> get originWaypoint {
  
  return $RouteWaypointModelCopyWith<$Res>(_self.originWaypoint, (value) {
    return _then(_self.copyWith(originWaypoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [DirectionsData].
extension DirectionsDataPatterns on DirectionsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DirectionsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DirectionsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DirectionsData value)  $default,){
final _that = this;
switch (_that) {
case _DirectionsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DirectionsData value)?  $default,){
final _that = this;
switch (_that) {
case _DirectionsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlaceModel place, @JsonKey(name: 'distance_meters')  double distanceMeters, @JsonKey(name: 'duration_minutes')  double durationMinutes, @JsonKey(name: 'origin_waypoint')  RouteWaypointModel originWaypoint,  List<RouteWaypointModel> waypoints,  List<NavigationStepModel> steps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DirectionsData() when $default != null:
return $default(_that.place,_that.distanceMeters,_that.durationMinutes,_that.originWaypoint,_that.waypoints,_that.steps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlaceModel place, @JsonKey(name: 'distance_meters')  double distanceMeters, @JsonKey(name: 'duration_minutes')  double durationMinutes, @JsonKey(name: 'origin_waypoint')  RouteWaypointModel originWaypoint,  List<RouteWaypointModel> waypoints,  List<NavigationStepModel> steps)  $default,) {final _that = this;
switch (_that) {
case _DirectionsData():
return $default(_that.place,_that.distanceMeters,_that.durationMinutes,_that.originWaypoint,_that.waypoints,_that.steps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlaceModel place, @JsonKey(name: 'distance_meters')  double distanceMeters, @JsonKey(name: 'duration_minutes')  double durationMinutes, @JsonKey(name: 'origin_waypoint')  RouteWaypointModel originWaypoint,  List<RouteWaypointModel> waypoints,  List<NavigationStepModel> steps)?  $default,) {final _that = this;
switch (_that) {
case _DirectionsData() when $default != null:
return $default(_that.place,_that.distanceMeters,_that.durationMinutes,_that.originWaypoint,_that.waypoints,_that.steps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DirectionsData implements DirectionsData {
  const _DirectionsData({required this.place, @JsonKey(name: 'distance_meters') required this.distanceMeters, @JsonKey(name: 'duration_minutes') required this.durationMinutes, @JsonKey(name: 'origin_waypoint') required this.originWaypoint, required  List<RouteWaypointModel> waypoints,  List<NavigationStepModel> steps = const []}): _waypoints = waypoints,_steps = steps;
  factory _DirectionsData.fromJson(Map<String, dynamic> json) => _$DirectionsDataFromJson(json);

@override final  PlaceModel place;
@override@JsonKey(name: 'distance_meters') final  double distanceMeters;
@override@JsonKey(name: 'duration_minutes') final  double durationMinutes;
@override@JsonKey(name: 'origin_waypoint') final  RouteWaypointModel originWaypoint;
 final  List<RouteWaypointModel> _waypoints;
@override List<RouteWaypointModel> get waypoints {
  if (_waypoints is EqualUnmodifiableListView) return _waypoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_waypoints);
}

 final  List<NavigationStepModel> _steps;
@override@JsonKey() List<NavigationStepModel> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}


/// Create a copy of DirectionsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DirectionsDataCopyWith<_DirectionsData> get copyWith => __$DirectionsDataCopyWithImpl<_DirectionsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DirectionsDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DirectionsData&&(identical(other.place, place) || other.place == place)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.originWaypoint, originWaypoint) || other.originWaypoint == originWaypoint)&&const DeepCollectionEquality().equals(other.waypoints, _waypoints)&&const DeepCollectionEquality().equals(other.steps, _steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,place,distanceMeters,durationMinutes,originWaypoint,const DeepCollectionEquality().hash(_waypoints),const DeepCollectionEquality().hash(_steps));
}

@override
String toString() {
    return 'DirectionsData(place: $place, distanceMeters: $distanceMeters, durationMinutes: $durationMinutes, originWaypoint: $originWaypoint, waypoints: $waypoints, steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$DirectionsDataCopyWith<$Res> implements $DirectionsDataCopyWith<$Res> {
  factory _$DirectionsDataCopyWith(_DirectionsData value, $Res Function(_DirectionsData) _then) = __$DirectionsDataCopyWithImpl;
@override @useResult
$Res call({
 PlaceModel place,@JsonKey(name: 'distance_meters') double distanceMeters,@JsonKey(name: 'duration_minutes') double durationMinutes,@JsonKey(name: 'origin_waypoint') RouteWaypointModel originWaypoint, List<RouteWaypointModel> waypoints, List<NavigationStepModel> steps
});


@override $PlaceModelCopyWith<$Res> get place;@override $RouteWaypointModelCopyWith<$Res> get originWaypoint;

}
/// @nodoc
class __$DirectionsDataCopyWithImpl<$Res>
    implements _$DirectionsDataCopyWith<$Res> {
  __$DirectionsDataCopyWithImpl(this._self, this._then);

  final _DirectionsData _self;
  final $Res Function(_DirectionsData) _then;

/// Create a copy of DirectionsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? place = null,Object? distanceMeters = null,Object? durationMinutes = null,Object? originWaypoint = null,Object? waypoints = null,Object? steps = null,}) {
  return _then(_DirectionsData(
place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as PlaceModel,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as double,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as double,originWaypoint: null == originWaypoint ? _self.originWaypoint : originWaypoint // ignore: cast_nullable_to_non_nullable
as RouteWaypointModel,waypoints: null == waypoints ? _self._waypoints : waypoints // ignore: cast_nullable_to_non_nullable
as List<RouteWaypointModel>,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<NavigationStepModel>,
  ));
}

/// Create a copy of DirectionsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceModelCopyWith<$Res> get place {
  
  return $PlaceModelCopyWith<$Res>(_self.place, (value) {
    return _then(_self.copyWith(place: value));
  });
}/// Create a copy of DirectionsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteWaypointModelCopyWith<$Res> get originWaypoint {
  
  return $RouteWaypointModelCopyWith<$Res>(_self.originWaypoint, (value) {
    return _then(_self.copyWith(originWaypoint: value));
  });
}
}

// dart format on
