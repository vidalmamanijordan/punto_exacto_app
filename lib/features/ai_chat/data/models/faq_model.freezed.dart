// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FaqModel {

 int get id; String get question; String get answer;
/// Create a copy of FaqModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqModelCopyWith<FaqModel> get copyWith => _$FaqModelCopyWithImpl<FaqModel>(this as FaqModel, _$identity);

  /// Serializes this FaqModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FaqModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.question, _this.question) || other.question == _this.question)&&(identical(other.answer, _this.answer) || other.answer == _this.answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FaqModel;
  return Object.hash(runtimeType,_this.id,_this.question,_this.answer);
}

@override
String toString() {
  final _this = this as FaqModel;
  return 'FaqModel(id: ${_this.id}, question: ${_this.question}, answer: ${_this.answer})';
}


}

/// @nodoc
abstract mixin class $FaqModelCopyWith<$Res>  {
  factory $FaqModelCopyWith(FaqModel value, $Res Function(FaqModel) _then) = _$FaqModelCopyWithImpl;
@useResult
$Res call({
 int id, String question, String answer
});




}
/// @nodoc
class _$FaqModelCopyWithImpl<$Res>
    implements $FaqModelCopyWith<$Res> {
  _$FaqModelCopyWithImpl(this._self, this._then);

  final FaqModel _self;
  final $Res Function(FaqModel) _then;

/// Create a copy of FaqModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? question = null,Object? answer = null,}) {
  return _then(FaqModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqModel].
extension FaqModelPatterns on FaqModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqModel value)  $default,){
final _that = this;
switch (_that) {
case _FaqModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqModel value)?  $default,){
final _that = this;
switch (_that) {
case _FaqModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String question,  String answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqModel() when $default != null:
return $default(_that.id,_that.question,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String question,  String answer)  $default,) {final _that = this;
switch (_that) {
case _FaqModel():
return $default(_that.id,_that.question,_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String question,  String answer)?  $default,) {final _that = this;
switch (_that) {
case _FaqModel() when $default != null:
return $default(_that.id,_that.question,_that.answer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqModel implements FaqModel {
  const _FaqModel({required this.id, required this.question, required this.answer});
  factory _FaqModel.fromJson(Map<String, dynamic> json) => _$FaqModelFromJson(json);

@override final  int id;
@override final  String question;
@override final  String answer;

/// Create a copy of FaqModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqModelCopyWith<_FaqModel> get copyWith => __$FaqModelCopyWithImpl<_FaqModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqModel&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,question,answer);
}

@override
String toString() {
    return 'FaqModel(id: $id, question: $question, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$FaqModelCopyWith<$Res> implements $FaqModelCopyWith<$Res> {
  factory _$FaqModelCopyWith(_FaqModel value, $Res Function(_FaqModel) _then) = __$FaqModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String question, String answer
});




}
/// @nodoc
class __$FaqModelCopyWithImpl<$Res>
    implements _$FaqModelCopyWith<$Res> {
  __$FaqModelCopyWithImpl(this._self, this._then);

  final _FaqModel _self;
  final $Res Function(_FaqModel) _then;

/// Create a copy of FaqModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? question = null,Object? answer = null,}) {
  return _then(_FaqModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
