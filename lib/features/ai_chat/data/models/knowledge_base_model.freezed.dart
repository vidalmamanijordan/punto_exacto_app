// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'knowledge_base_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KnowledgeBaseModel {

 int get id; String get title; String get content;
/// Create a copy of KnowledgeBaseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeBaseModelCopyWith<KnowledgeBaseModel> get copyWith => _$KnowledgeBaseModelCopyWithImpl<KnowledgeBaseModel>(this as KnowledgeBaseModel, _$identity);

  /// Serializes this KnowledgeBaseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as KnowledgeBaseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgeBaseModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.content, _this.content) || other.content == _this.content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as KnowledgeBaseModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.content);
}

@override
String toString() {
  final _this = this as KnowledgeBaseModel;
  return 'KnowledgeBaseModel(id: ${_this.id}, title: ${_this.title}, content: ${_this.content})';
}


}

/// @nodoc
abstract mixin class $KnowledgeBaseModelCopyWith<$Res>  {
  factory $KnowledgeBaseModelCopyWith(KnowledgeBaseModel value, $Res Function(KnowledgeBaseModel) _then) = _$KnowledgeBaseModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String content
});




}
/// @nodoc
class _$KnowledgeBaseModelCopyWithImpl<$Res>
    implements $KnowledgeBaseModelCopyWith<$Res> {
  _$KnowledgeBaseModelCopyWithImpl(this._self, this._then);

  final KnowledgeBaseModel _self;
  final $Res Function(KnowledgeBaseModel) _then;

/// Create a copy of KnowledgeBaseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? content = null,}) {
  return _then(KnowledgeBaseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [KnowledgeBaseModel].
extension KnowledgeBaseModelPatterns on KnowledgeBaseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnowledgeBaseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnowledgeBaseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnowledgeBaseModel value)  $default,){
final _that = this;
switch (_that) {
case _KnowledgeBaseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnowledgeBaseModel value)?  $default,){
final _that = this;
switch (_that) {
case _KnowledgeBaseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KnowledgeBaseModel() when $default != null:
return $default(_that.id,_that.title,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String content)  $default,) {final _that = this;
switch (_that) {
case _KnowledgeBaseModel():
return $default(_that.id,_that.title,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String content)?  $default,) {final _that = this;
switch (_that) {
case _KnowledgeBaseModel() when $default != null:
return $default(_that.id,_that.title,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KnowledgeBaseModel implements KnowledgeBaseModel {
  const _KnowledgeBaseModel({required this.id, required this.title, required this.content});
  factory _KnowledgeBaseModel.fromJson(Map<String, dynamic> json) => _$KnowledgeBaseModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String content;

/// Create a copy of KnowledgeBaseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgeBaseModelCopyWith<_KnowledgeBaseModel> get copyWith => __$KnowledgeBaseModelCopyWithImpl<_KnowledgeBaseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KnowledgeBaseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowledgeBaseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,content);
}

@override
String toString() {
    return 'KnowledgeBaseModel(id: $id, title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class _$KnowledgeBaseModelCopyWith<$Res> implements $KnowledgeBaseModelCopyWith<$Res> {
  factory _$KnowledgeBaseModelCopyWith(_KnowledgeBaseModel value, $Res Function(_KnowledgeBaseModel) _then) = __$KnowledgeBaseModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String content
});




}
/// @nodoc
class __$KnowledgeBaseModelCopyWithImpl<$Res>
    implements _$KnowledgeBaseModelCopyWith<$Res> {
  __$KnowledgeBaseModelCopyWithImpl(this._self, this._then);

  final _KnowledgeBaseModel _self;
  final $Res Function(_KnowledgeBaseModel) _then;

/// Create a copy of KnowledgeBaseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? content = null,}) {
  return _then(_KnowledgeBaseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
