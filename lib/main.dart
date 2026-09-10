import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'features/ai_chat/presentation/screens/chat_screen.dart';

void main() {
  runApp(const ProviderScope(child: PuntoExactoApp()));
}

class PuntoExactoApp extends StatelessWidget {
  const PuntoExactoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Punto Exacto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ChatScreen(),
    );
  }
}
