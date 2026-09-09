import '../../data/models/chat_message.dart';

class AiChatState {
  final List<ChatMessage> messages;
  final bool isLoading;
  final String? errorMessage;
  final int? selectedCampusId;

  const AiChatState({
    this.messages = const [],
    this.isLoading = false,
    this.errorMessage,
    this.selectedCampusId,
  });

  AiChatState copyWith({
    List<ChatMessage>? messages,
    bool? isLoading,
    String? errorMessage,
    int? selectedCampusId,
    bool clearError = false,
  }) {
    return AiChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      selectedCampusId: selectedCampusId ?? this.selectedCampusId,
    );
  }
}
