import 'package:freezed_annotation/freezed_annotation.dart';

part 'knowledge_base_model.freezed.dart';
part 'knowledge_base_model.g.dart';

@freezed
abstract class KnowledgeBaseModel with _$KnowledgeBaseModel {
  const factory KnowledgeBaseModel({
    required int id,
    required String title,
    required String content,
  }) = _KnowledgeBaseModel;

  factory KnowledgeBaseModel.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeBaseModelFromJson(json);
}
