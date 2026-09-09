import '../../domain/repositories/ai_chat_repository.dart';
import '../datasources/ai_chat_remote_datasource.dart';
import '../models/chat_response.dart';

class AiChatRepositoryImpl implements AiChatRepository {
  final AiChatRemoteDataSource _remoteDataSource;

  AiChatRepositoryImpl(this._remoteDataSource);

  @override
  Future<ChatResponse> sendMessage({required String message, int? campusId}) {
    return _remoteDataSource.sendMessage(message: message, campusId: campusId);
  }
}
