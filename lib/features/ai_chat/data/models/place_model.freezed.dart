// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceModel {

 int get id; String get name; String? get description; String? get building; String? get floor; String? get room; String? get image; String? get latitude; String? get longitude;
/// Create a copy of PlaceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceModelCopyWith<PlaceModel> get copyWith => _$PlaceModelCopyWithImpl<PlaceModel>(this as PlaceModel, _$identity);

  /// Serializes this PlaceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlaceModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.building, _this.building) || other.building == _this.building)&&(identical(other.floor, _this.floor) || other.floor == _this.floor)&&(identical(other.room, _this.room) || other.room == _this.room)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlaceModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description,_this.building,_this.floor,_this.room,_this.image,_this.latitude,_this.longitude);
}

@override
String toString() {
  final _this = this as PlaceModel;
  return 'PlaceModel(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, building: ${_this.building}, floor: ${_this.floor}, room: ${_this.room}, image: ${_this.image}, latitude: ${_this.latitude}, longitude: ${_this.longitude})';
}


}

/// @nodoc
abstract mixin class $PlaceModelCopyWith<$Res>  {
  factory $PlaceModelCopyWith(PlaceModel value, $Res Function(PlaceModel) _then) = _$PlaceModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? description, String? building, String? floor, String? room, String? image, String? latitude, String? longitude
});




}
/// @nodoc
class _$PlaceModelCopyWithImpl<$Res>
    implements $PlaceModelCopyWith<$Res> {
  _$PlaceModelCopyWithImpl(this._self, this._then);

  final PlaceModel _self;
  final $Res Function(PlaceModel) _then;

/// Create a copy of PlaceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? building = freezed,Object? floor = freezed,Object? room = freezed,Object? image = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(PlaceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaceModel].
extension PlaceModelPatterns on PlaceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceModel value)  $default,){
final _that = this;
switch (_that) {
case _PlaceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String? building,  String? floor,  String? room,  String? image,  String? latitude,  String? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.building,_that.floor,_that.room,_that.image,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String? building,  String? floor,  String? room,  String? image,  String? latitude,  String? longitude)  $default,) {final _that = this;
switch (_that) {
case _PlaceModel():
return $default(_that.id,_that.name,_that.description,_that.building,_that.floor,_that.room,_that.image,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? description,  String? building,  String? floor,  String? room,  String? image,  String? latitude,  String? longitude)?  $default,) {final _that = this;
switch (_that) {
case _PlaceModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.building,_that.floor,_that.room,_that.image,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaceModel implements PlaceModel {
  const _PlaceModel({required this.id, required this.name, this.description, this.building, this.floor, this.room, this.image, this.latitude, this.longitude});
  factory _PlaceModel.fromJson(Map<String, dynamic> json) => _$PlaceModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? description;
@override final  String? building;
@override final  String? floor;
@override final  String? room;
@override final  String? image;
@override final  String? latitude;
@override final  String? longitude;

/// Create a copy of PlaceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceModelCopyWith<_PlaceModel> get copyWith => __$PlaceModelCopyWithImpl<_PlaceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.building, building) || other.building == building)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.room, room) || other.room == room)&&(identical(other.image, image) || other.image == image)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description,building,floor,room,image,latitude,longitude);
}

@override
String toString() {
    return 'PlaceModel(id: $id, name: $name, description: $description, building: $building, floor: $floor, room: $room, image: $image, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$PlaceModelCopyWith<$Res> implements $PlaceModelCopyWith<$Res> {
  factory _$PlaceModelCopyWith(_PlaceModel value, $Res Function(_PlaceModel) _then) = __$PlaceModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? description, String? building, String? floor, String? room, String? image, String? latitude, String? longitude
});




}
/// @nodoc
class __$PlaceModelCopyWithImpl<$Res>
    implements _$PlaceModelCopyWith<$Res> {
  __$PlaceModelCopyWithImpl(this._self, this._then);

  final _PlaceModel _self;
  final $Res Function(_PlaceModel) _then;

/// Create a copy of PlaceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? building = freezed,Object? floor = freezed,Object? room = freezed,Object? image = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_PlaceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
