import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(
      // PARA EMULADOR ANDROID: Use 10.0.2.2:3000
      // PARA DISPOSITIVO FÍSICO: Use o IP da sua máquina (ex: 192.168.0.15:3000)
      baseUrl: 'http://10.0.2.2:3000', // <--- Mudei para 3000 conforme o seu README
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  Dio get client => _dio;
}