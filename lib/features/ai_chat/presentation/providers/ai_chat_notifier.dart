import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_exception.dart';
import '../../data/models/chat_message.dart';
import 'ai_chat_providers.dart';
import 'ai_chat_state.dart';

class AiChatNotifier extends Notifier<AiChatState> {
  @override
  AiChatState build() => const AiChatState();

  void setCampus(int? campusId) {
    state = state.copyWith(selectedCampusId: campusId);
  }

  Future<void> sendMessage(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || state.isLoading) return;

    // 1. Agregamos el mensaje del usuario de inmediato, para que
    //    la conversación se sienta instantánea mientras esperamos
    //    la respuesta del backend.
    final userMessage = ChatMessage(
      sender: ChatMessageSender.user,
      text: trimmed,
    );

    state = state.copyWith(
      messages: [...state.messages, userMessage],
      isLoading: true,
      clearError: true,
    );

    try {
      final repository = ref.read(aiChatRepositoryProvider);

      final response = await repository.sendMessage(
        message: trimmed,
        campusId: state.selectedCampusId,
      );

      final assistantMessage = ChatMessage(
        sender: ChatMessageSender.assistant,
        text: response.message,
        responseData: response.data,
      );

      state = state.copyWith(
        messages: [...state.messages, assistantMessage],
        isLoading: false,
      );
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    }
  }
}

final aiChatNotifierProvider = NotifierProvider<AiChatNotifier, AiChatState>(
  AiChatNotifier.new,
);
