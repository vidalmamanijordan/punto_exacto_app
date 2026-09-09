import '../../data/models/chat_response.dart';

/// Contrato abstracto: la capa de presentación depende de esto,
/// no de la implementación concreta ni de Dio directamente.
abstract class AiChatRepository {
  Future<ChatResponse> sendMessage({required String message, int? campusId});
}
