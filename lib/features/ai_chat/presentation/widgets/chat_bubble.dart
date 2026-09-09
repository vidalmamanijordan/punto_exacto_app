import 'package:flutter/material.dart';

import '../../data/models/chat_message.dart';
import 'place_result_card.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  bool get _isUser => message.sender == ChatMessageSender.user;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Column(
        crossAxisAlignment:
            _isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Align(
            alignment: _isUser ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: _isUser
                    ? colorScheme.primary
                    : colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(_isUser ? 18 : 4),
                  bottomRight: Radius.circular(_isUser ? 4 : 18),
                ),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: _isUser
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface,
                ),
              ),
            ),
          ),
          if (!_isUser && message.responseData != null) ...[
            if (message.responseData!.place != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: PlaceResultCard(place: message.responseData!.place!),
              ),
            if (message.responseData!.faqs.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: _FaqList(faqs: message.responseData!.faqs
                    .map((f) => f.question)
                    .toList()),
              ),
          ],
        ],
      ),
    );
  }
}

class _FaqList extends StatelessWidget {
  final List<String> faqs;

  const _FaqList({required this.faqs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: faqs
          .map(
            (q) => Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.help_outline, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      q,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
