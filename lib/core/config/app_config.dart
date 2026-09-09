class AppConfig {
  AppConfig._();

  static const String apiBaseUrl = 'http://192.168.145.44:8000/api';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
}
