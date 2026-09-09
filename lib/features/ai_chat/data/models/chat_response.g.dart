// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) =>
    _ChatResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: ChatResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatResponseToJson(_ChatResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_ChatResponseData _$ChatResponseDataFromJson(Map<String, dynamic> json) =>
    _ChatResponseData(
      place: json['place'] == null
          ? null
          : PlaceModel.fromJson(json['place'] as Map<String, dynamic>),
      faqs:
          (json['faqs'] as List<dynamic>?)
              ?.map((e) => FaqModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      knowledgeBase:
          (json['knowledge_base'] as List<dynamic>?)
              ?.map(
                (e) => KnowledgeBaseModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      intent: json['intent'] as String,
    );

Map<String, dynamic> _$ChatResponseDataToJson(_ChatResponseData instance) =>
    <String, dynamic>{
      'place': instance.place,
      'faqs': instance.faqs,
      'knowledge_base': instance.knowledgeBase,
      'intent': instance.intent,
    };
