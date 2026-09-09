import 'chat_response.dart';

enum ChatMessageSender { user, assistant }

class ChatMessage {
  final ChatMessageSender sender;
  final String text;
  final ChatResponseData? responseData;

  const ChatMessage({
    required this.sender,
    required this.text,
    this.responseData,
  });
}
