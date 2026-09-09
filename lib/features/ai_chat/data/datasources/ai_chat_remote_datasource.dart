import '../../../../core/network/api_client.dart';

import 'package:dio/dio.dart';

import '../models/chat_response.dart';

/// Responsable únicamente de hacer la llamada HTTP cruda.
/// No contiene lógica de negocio ni maneja estado de la UI.
class AiChatRemoteDataSource {
  final ApiClient _apiClient;

  AiChatRemoteDataSource(this._apiClient);

  Future<ChatResponse> sendMessage({
    required String message,
    int? campusId,
  }) async {
    try {
      final response = await _apiClient.dio.post(
        '/ai/chat',
        data: {'message': message, if (campusId != null) 'campus_id': campusId},
      );

      return ChatResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _apiClient.handleError(e);
    }
  }
}
