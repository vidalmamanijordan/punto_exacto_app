// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KnowledgeBaseModel _$KnowledgeBaseModelFromJson(Map<String, dynamic> json) =>
    _KnowledgeBaseModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$KnowledgeBaseModelToJson(_KnowledgeBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
    };
