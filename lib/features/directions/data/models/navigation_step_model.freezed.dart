// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_step_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NavigationStepModel {

 String get instruction; double get distance;
/// Create a copy of NavigationStepModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationStepModelCopyWith<NavigationStepModel> get copyWith => _$NavigationStepModelCopyWithImpl<NavigationStepModel>(this as NavigationStepModel, _$identity);

  /// Serializes this NavigationStepModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NavigationStepModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationStepModel&&(identical(other.instruction, _this.instruction) || other.instruction == _this.instruction)&&(identical(other.distance, _this.distance) || other.distance == _this.distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NavigationStepModel;
  return Object.hash(runtimeType,_this.instruction,_this.distance);
}

@override
String toString() {
  final _this = this as NavigationStepModel;
  return 'NavigationStepModel(instruction: ${_this.instruction}, distance: ${_this.distance})';
}


}

/// @nodoc
abstract mixin class $NavigationStepModelCopyWith<$Res>  {
  factory $NavigationStepModelCopyWith(NavigationStepModel value, $Res Function(NavigationStepModel) _then) = _$NavigationStepModelCopyWithImpl;
@useResult
$Res call({
 String instruction, double distance
});




}
/// @nodoc
class _$NavigationStepModelCopyWithImpl<$Res>
    implements $NavigationStepModelCopyWith<$Res> {
  _$NavigationStepModelCopyWithImpl(this._self, this._then);

  final NavigationStepModel _self;
  final $Res Function(NavigationStepModel) _then;

/// Create a copy of NavigationStepModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? instruction = null,Object? distance = null,}) {
  return _then(NavigationStepModel(
instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NavigationStepModel].
extension NavigationStepModelPatterns on NavigationStepModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationStepModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationStepModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationStepModel value)  $default,){
final _that = this;
switch (_that) {
case _NavigationStepModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationStepModel value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationStepModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String instruction,  double distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigationStepModel() when $default != null:
return $default(_that.instruction,_that.distance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String instruction,  double distance)  $default,) {final _that = this;
switch (_that) {
case _NavigationStepModel():
return $default(_that.instruction,_that.distance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String instruction,  double distance)?  $default,) {final _that = this;
switch (_that) {
case _NavigationStepModel() when $default != null:
return $default(_that.instruction,_that.distance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NavigationStepModel implements NavigationStepModel {
  const _NavigationStepModel({required this.instruction, required this.distance});
  factory _NavigationStepModel.fromJson(Map<String, dynamic> json) => _$NavigationStepModelFromJson(json);

@override final  String instruction;
@override final  double distance;

/// Create a copy of NavigationStepModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationStepModelCopyWith<_NavigationStepModel> get copyWith => __$NavigationStepModelCopyWithImpl<_NavigationStepModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NavigationStepModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationStepModel&&(identical(other.instruction, instruction) || other.instruction == instruction)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,instruction,distance);
}

@override
String toString() {
    return 'NavigationStepModel(instruction: $instruction, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$NavigationStepModelCopyWith<$Res> implements $NavigationStepModelCopyWith<$Res> {
  factory _$NavigationStepModelCopyWith(_NavigationStepModel value, $Res Function(_NavigationStepModel) _then) = __$NavigationStepModelCopyWithImpl;
@override @useResult
$Res call({
 String instruction, double distance
});




}
/// @nodoc
class __$NavigationStepModelCopyWithImpl<$Res>
    implements _$NavigationStepModelCopyWith<$Res> {
  __$NavigationStepModelCopyWithImpl(this._self, this._then);

  final _NavigationStepModel _self;
  final $Res Function(_NavigationStepModel) _then;

/// Create a copy of NavigationStepModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? instruction = null,Object? distance = null,}) {
  return _then(_NavigationStepModel(
instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
