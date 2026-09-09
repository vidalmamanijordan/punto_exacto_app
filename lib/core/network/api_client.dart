import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../config/app_config.dart';
import 'api_exception.dart';

/// Cliente HTTP central de la app. Todas las llamadas a la API
/// de Laravel pasan por aquí, nunca se instancia Dio directamente
/// en otro lugar.
class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: AppConfig.connectTimeout,
        receiveTimeout: AppConfig.receiveTimeout,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    // Solo registramos el log de requests/responses en modo debug,
    // para no ensuciar la consola (ni exponer datos) en producción.
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  Dio get dio => _dio;

  /// Envuelve las excepciones de Dio en nuestra [ApiException],
  /// con un mensaje legible según el tipo de error.
  ApiException handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ApiException(
          message: 'La conexión tardó demasiado. Verifica tu internet.',
        );

      case DioExceptionType.connectionError:
        return const ApiException(
          message: 'No se pudo conectar al servidor. ¿Está encendido?',
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;

        final message = (data is Map && data['message'] != null)
            ? data['message'].toString()
            : 'Ocurrió un error en el servidor.';

        return ApiException(message: message, statusCode: statusCode);

      default:
        return const ApiException(message: 'Ocurrió un error inesperado.');
    }
  }
}
