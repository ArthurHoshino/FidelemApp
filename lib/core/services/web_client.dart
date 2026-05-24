import 'dart:convert';
import 'package:http/http.dart' as http;

enum HttpMethod { post, put, delete }

class WebClient {
  // URL base quando App Flutter rodando em um Emulador Android.
  static const String baseUrl = 'http://10.254.204.22:3000'; // TODO MELHORAR ESSA CONFIGURAÇÃO
  // URL base quando Servidor Web/Dart rodando diretamente no PC.
  // static const String baseUrl = 'http://127.0.0.1:3000';

  // --- Endpoints (Tabelas) ---
  static const String cdEmpresa = 'cdempresa';
  static const String cdCargo = 'cdcargo';
  static const String cdSenha = 'cdsenha';
  static const String cdProduto = 'cdproduto';

  // Requisições sem body (GET)
  static Future<http.Response> getData(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {

    final queryString = queryParameters?.map((key, value) {
      return MapEntry(key, value.toString());
    });
    
    final uri = Uri.parse('$baseUrl/$endpoint').replace(queryParameters: queryString);

    try {
      final response = await http.get(uri);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Requisições com body (POST, PUT, DELETE)
  static Future<http.Response> sendData({
    required String endpoint,
    required HttpMethod method,
    required Map<String, dynamic> data,
  }) async {
    final uri = Uri.parse('$baseUrl/$endpoint');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(data);

    try {
      http.Response response;

      switch (method) {
        case HttpMethod.post:
          response = await http.post(uri, headers: headers, body: body);
          break;
        case HttpMethod.put:
          response = await http.put(uri, headers: headers, body: body);
          break;
        case HttpMethod.delete:
          response = await http.delete(uri, headers: headers, body: body);
          break;
        }

      return response;
    } catch (e) {
      rethrow;
    }
  }
}