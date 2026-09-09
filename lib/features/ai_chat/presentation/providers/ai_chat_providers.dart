import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/ai_chat_remote_datasource.dart';
import '../../data/repositories/ai_chat_repository_impl.dart';
import '../../domain/repositories/ai_chat_repository.dart';

/// Una sola instancia de ApiClient para toda la app.
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

final aiChatRemoteDataSourceProvider = Provider<AiChatRemoteDataSource>((ref) {
  return AiChatRemoteDataSource(ref.watch(apiClientProvider));
});

final aiChatRepositoryProvider = Provider<AiChatRepository>((ref) {
  return AiChatRepositoryImpl(ref.watch(aiChatRemoteDataSourceProvider));
});