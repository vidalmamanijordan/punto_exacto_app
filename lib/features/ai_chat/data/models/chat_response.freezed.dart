// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatResponse {

 bool get success; String get message; ChatResponseData get data;
/// Create a copy of ChatResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatResponseCopyWith<ChatResponse> get copyWith => _$ChatResponseCopyWithImpl<ChatResponse>(this as ChatResponse, _$identity);

  /// Serializes this ChatResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChatResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatResponse&&(identical(other.success, _this.success) || other.success == _this.success)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.data, _this.data) || other.data == _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChatResponse;
  return Object.hash(runtimeType,_this.success,_this.message,_this.data);
}

@override
String toString() {
  final _this = this as ChatResponse;
  return 'ChatResponse(success: ${_this.success}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $ChatResponseCopyWith<$Res>  {
  factory $ChatResponseCopyWith(ChatResponse value, $Res Function(ChatResponse) _then) = _$ChatResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, ChatResponseData data
});


$ChatResponseDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ChatResponseCopyWithImpl<$Res>
    implements $ChatResponseCopyWith<$Res> {
  _$ChatResponseCopyWithImpl(this._self, this._then);

  final ChatResponse _self;
  final $Res Function(ChatResponse) _then;

/// Create a copy of ChatResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(ChatResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ChatResponseData,
  ));
}
/// Create a copy of ChatResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatResponseDataCopyWith<$Res> get data {
  
  return $ChatResponseDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatResponse].
extension ChatResponsePatterns on ChatResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChatResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChatResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  ChatResponseData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  ChatResponseData data)  $default,) {final _that = this;
switch (_that) {
case _ChatResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  ChatResponseData data)?  $default,) {final _that = this;
switch (_that) {
case _ChatResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatResponse implements ChatResponse {
  const _ChatResponse({required this.success, required this.message, required this.data});
  factory _ChatResponse.fromJson(Map<String, dynamic> json) => _$ChatResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  ChatResponseData data;

/// Create a copy of ChatResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatResponseCopyWith<_ChatResponse> get copyWith => __$ChatResponseCopyWithImpl<_ChatResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,success,message,data);
}

@override
String toString() {
    return 'ChatResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ChatResponseCopyWith<$Res> implements $ChatResponseCopyWith<$Res> {
  factory _$ChatResponseCopyWith(_ChatResponse value, $Res Function(_ChatResponse) _then) = __$ChatResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, ChatResponseData data
});


@override $ChatResponseDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ChatResponseCopyWithImpl<$Res>
    implements _$ChatResponseCopyWith<$Res> {
  __$ChatResponseCopyWithImpl(this._self, this._then);

  final _ChatResponse _self;
  final $Res Function(_ChatResponse) _then;

/// Create a copy of ChatResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_ChatResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ChatResponseData,
  ));
}

/// Create a copy of ChatResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatResponseDataCopyWith<$Res> get data {
  
  return $ChatResponseDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ChatResponseData {

 PlaceModel? get place; List<FaqModel> get faqs;@JsonKey(name: 'knowledge_base') List<KnowledgeBaseModel> get knowledgeBase; String get intent;
/// Create a copy of ChatResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatResponseDataCopyWith<ChatResponseData> get copyWith => _$ChatResponseDataCopyWithImpl<ChatResponseData>(this as ChatResponseData, _$identity);

  /// Serializes this ChatResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChatResponseData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatResponseData&&(identical(other.place, _this.place) || other.place == _this.place)&&const DeepCollectionEquality().equals(other.faqs, _this.faqs)&&const DeepCollectionEquality().equals(other.knowledgeBase, _this.knowledgeBase)&&(identical(other.intent, _this.intent) || other.intent == _this.intent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChatResponseData;
  return Object.hash(runtimeType,_this.place,const DeepCollectionEquality().hash(_this.faqs),const DeepCollectionEquality().hash(_this.knowledgeBase),_this.intent);
}

@override
String toString() {
  final _this = this as ChatResponseData;
  return 'ChatResponseData(place: ${_this.place}, faqs: ${_this.faqs}, knowledgeBase: ${_this.knowledgeBase}, intent: ${_this.intent})';
}


}

/// @nodoc
abstract mixin class $ChatResponseDataCopyWith<$Res>  {
  factory $ChatResponseDataCopyWith(ChatResponseData value, $Res Function(ChatResponseData) _then) = _$ChatResponseDataCopyWithImpl;
@useResult
$Res call({
 PlaceModel? place, List<FaqModel> faqs,@JsonKey(name: 'knowledge_base') List<KnowledgeBaseModel> knowledgeBase, String intent
});


$PlaceModelCopyWith<$Res>? get place;

}
/// @nodoc
class _$ChatResponseDataCopyWithImpl<$Res>
    implements $ChatResponseDataCopyWith<$Res> {
  _$ChatResponseDataCopyWithImpl(this._self, this._then);

  final ChatResponseData _self;
  final $Res Function(ChatResponseData) _then;

/// Create a copy of ChatResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? place = freezed,Object? faqs = null,Object? knowledgeBase = null,Object? intent = null,}) {
  return _then(ChatResponseData(
place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as PlaceModel?,faqs: null == faqs ? _self.faqs : faqs // ignore: cast_nullable_to_non_nullable
as List<FaqModel>,knowledgeBase: null == knowledgeBase ? _self.knowledgeBase : knowledgeBase // ignore: cast_nullable_to_non_nullable
as List<KnowledgeBaseModel>,intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ChatResponseData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceModelCopyWith<$Res>? get place {
    if (_self.place == null) {
    return null;
  }

  return $PlaceModelCopyWith<$Res>(_self.place!, (value) {
    return _then(_self.copyWith(place: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatResponseData].
extension ChatResponseDataPatterns on ChatResponseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatResponseData value)  $default,){
final _that = this;
switch (_that) {
case _ChatResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatResponseData value)?  $default,){
final _that = this;
switch (_that) {
case _ChatResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlaceModel? place,  List<FaqModel> faqs, @JsonKey(name: 'knowledge_base')  List<KnowledgeBaseModel> knowledgeBase,  String intent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatResponseData() when $default != null:
return $default(_that.place,_that.faqs,_that.knowledgeBase,_that.intent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlaceModel? place,  List<FaqModel> faqs, @JsonKey(name: 'knowledge_base')  List<KnowledgeBaseModel> knowledgeBase,  String intent)  $default,) {final _that = this;
switch (_that) {
case _ChatResponseData():
return $default(_that.place,_that.faqs,_that.knowledgeBase,_that.intent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlaceModel? place,  List<FaqModel> faqs, @JsonKey(name: 'knowledge_base')  List<KnowledgeBaseModel> knowledgeBase,  String intent)?  $default,) {final _that = this;
switch (_that) {
case _ChatResponseData() when $default != null:
return $default(_that.place,_that.faqs,_that.knowledgeBase,_that.intent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatResponseData implements ChatResponseData {
  const _ChatResponseData({this.place,  List<FaqModel> faqs = const [], @JsonKey(name: 'knowledge_base')  List<KnowledgeBaseModel> knowledgeBase = const [], required this.intent}): _faqs = faqs,_knowledgeBase = knowledgeBase;
  factory _ChatResponseData.fromJson(Map<String, dynamic> json) => _$ChatResponseDataFromJson(json);

@override final  PlaceModel? place;
 final  List<FaqModel> _faqs;
@override@JsonKey() List<FaqModel> get faqs {
  if (_faqs is EqualUnmodifiableListView) return _faqs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_faqs);
}

 final  List<KnowledgeBaseModel> _knowledgeBase;
@override@JsonKey(name: 'knowledge_base') List<KnowledgeBaseModel> get knowledgeBase {
  if (_knowledgeBase is EqualUnmodifiableListView) return _knowledgeBase;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_knowledgeBase);
}

@override final  String intent;

/// Create a copy of ChatResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatResponseDataCopyWith<_ChatResponseData> get copyWith => __$ChatResponseDataCopyWithImpl<_ChatResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatResponseData&&(identical(other.place, place) || other.place == place)&&const DeepCollectionEquality().equals(other.faqs, _faqs)&&const DeepCollectionEquality().equals(other.knowledgeBase, _knowledgeBase)&&(identical(other.intent, intent) || other.intent == intent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,place,const DeepCollectionEquality().hash(_faqs),const DeepCollectionEquality().hash(_knowledgeBase),intent);
}

@override
String toString() {
    return 'ChatResponseData(place: $place, faqs: $faqs, knowledgeBase: $knowledgeBase, intent: $intent)';
}


}

/// @nodoc
abstract mixin class _$ChatResponseDataCopyWith<$Res> implements $ChatResponseDataCopyWith<$Res> {
  factory _$ChatResponseDataCopyWith(_ChatResponseData value, $Res Function(_ChatResponseData) _then) = __$ChatResponseDataCopyWithImpl;
@override @useResult
$Res call({
 PlaceModel? place, List<FaqModel> faqs,@JsonKey(name: 'knowledge_base') List<KnowledgeBaseModel> knowledgeBase, String intent
});


@override $PlaceModelCopyWith<$Res>? get place;

}
/// @nodoc
class __$ChatResponseDataCopyWithImpl<$Res>
    implements _$ChatResponseDataCopyWith<$Res> {
  __$ChatResponseDataCopyWithImpl(this._self, this._then);

  final _ChatResponseData _self;
  final $Res Function(_ChatResponseData) _then;

/// Create a copy of ChatResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? place = freezed,Object? faqs = null,Object? knowledgeBase = null,Object? intent = null,}) {
  return _then(_ChatResponseData(
place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as PlaceModel?,faqs: null == faqs ? _self._faqs : faqs // ignore: cast_nullable_to_non_nullable
as List<FaqModel>,knowledgeBase: null == knowledgeBase ? _self._knowledgeBase : knowledgeBase // ignore: cast_nullable_to_non_nullable
as List<KnowledgeBaseModel>,intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ChatResponseData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceModelCopyWith<$Res>? get place {
    if (_self.place == null) {
    return null;
  }

  return $PlaceModelCopyWith<$Res>(_self.place!, (value) {
    return _then(_self.copyWith(place: value));
  });
}
}

// dart format on
