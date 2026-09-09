import 'package:freezed_annotation/freezed_annotation.dart';

import 'faq_model.dart';
import 'knowledge_base_model.dart';
import 'place_model.dart';

part 'chat_response.freezed.dart';
part 'chat_response.g.dart';

@freezed
abstract class ChatResponse with _$ChatResponse {
  const factory ChatResponse({
    required bool success,
    required String message,
    required ChatResponseData data,
  }) = _ChatResponse;

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
}

@freezed
abstract class ChatResponseData with _$ChatResponseData {
  const factory ChatResponseData({
    PlaceModel? place,
    @Default([]) List<FaqModel> faqs,
    @JsonKey(name: 'knowledge_base')
    @Default([])
    List<KnowledgeBaseModel> knowledgeBase,
    required String intent,
  }) = _ChatResponseData;

  factory ChatResponseData.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseDataFromJson(json);
}
