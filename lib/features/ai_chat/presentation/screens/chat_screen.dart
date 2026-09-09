import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/ai_chat_notifier.dart';
import '../providers/campus_providers.dart';
import '../widgets/chat_bubble.dart';
import '../providers/campus_detection_provider.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleSend() {
    final text = _textController.text;
    if (text.trim().isEmpty) return;

    ref.read(aiChatNotifierProvider.notifier).sendMessage(text);
    _textController.clear();
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(aiChatNotifierProvider);
    final campusesAsync = ref.watch(campusListProvider);

    // Muestra el error como un SnackBar, sin bloquear la conversación.
    ref.listen(aiChatNotifierProvider, (previous, next) {
      if (next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }

      if (next.messages.length != previous?.messages.length) {
        _scrollToBottom();
      }
    });

    // Detección automática de campus: en cuanto se resuelve,
    // preselecciona el campus en el chat (el usuario puede
    // cambiarlo manualmente después desde el selector).
    ref.listen(campusDetectionProvider, (previous, next) {
      next.whenData((state) {
        if (state is CampusDetectionSuccess) {
          ref.read(aiChatNotifierProvider.notifier).setCampus(state.campus.id);
        }
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Punto Exacto'),
        actions: [
          Consumer(
            builder: (context, ref, _) {
              final detection = ref.watch(campusDetectionProvider);

              return detection.when(
                data: (state) => switch (state) {
                  CampusDetectionLoading() => const SizedBox(),
                  CampusDetectionSuccess() => const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Icon(
                      Icons.my_location,
                      size: 16,
                      color: Colors.green,
                    ),
                  ),
                  CampusDetectionFailed() => const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Icon(
                      Icons.location_off,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                },
                loading: () => const Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                error: (_, __) => const SizedBox(),
              );
            },
          ),
          campusesAsync.when(
            data: (campuses) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: DropdownButton<int?>(
                value: chatState.selectedCampusId,
                hint: const Text('Campus'),
                dropdownColor: Theme.of(context).colorScheme.surface,
                underline: const SizedBox(),
                items: [
                  const DropdownMenuItem(value: null, child: Text('Todos')),
                  ...campuses.map(
                    (c) => DropdownMenuItem(value: c.id, child: Text(c.name)),
                  ),
                ],
                onChanged: (value) {
                  ref.read(aiChatNotifierProvider.notifier).setCampus(value);
                },
              ),
            ),
            loading: () => const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            error: (_, __) => const SizedBox(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: chatState.messages.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'Pregúntame dónde queda un lugar, un horario, o cualquier duda sobre el campus.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: chatState.messages.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(message: chatState.messages[index]);
                    },
                  ),
          ),

          if (chatState.isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        hintText: 'Escribe tu pregunta...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                      onSubmitted: (_) => _handleSend(),
                      textInputAction: TextInputAction.send,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filled(
                    onPressed: chatState.isLoading ? null : _handleSend,
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
