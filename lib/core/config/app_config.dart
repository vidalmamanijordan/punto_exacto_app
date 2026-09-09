class AppConfig {
  AppConfig._();

  static const String apiBaseUrl = 'http://192.168.145.44:8000/api';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);

  /// Distancia en metros dentro de la cual consideramos que
  /// el usuario "llegó" a su destino.
  static const double arrivalThresholdMeters = 15;
}
