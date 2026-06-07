import 'dart:convert';
import 'package:http/http.dart' as http;

enum HttpMethod { post, put, delete }

class WebClient {
  // URL base quando App Flutter rodando em um Emulador Android.
  static const String baseUrl = 'http://192.168.15.159:3000'; // TODO MELHORAR ESSA CONFIGURAÇÃO
  // URL base quando Servidor Web/Dart rodando diretamente no PC.
  // static const String baseUrl = 'http://127.0.0.1:3000';

  // --- Endpoints (Tabelas) ---
  static const String cdEmpresa = 'cdempresa';
  static const String cdCargo = 'cdcargo';
  static const String cdSenha = 'cdsenha';
  static const String cdProduto = 'cdproduto';
  static const String cdCategoria = 'cdcategoria';
  static const String cdProdutoImagem = 'cdprodutoimagem';
  static const String iaService = 'ia-service';

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

  // Requisições Multipart para upload de imagens
  static Future<http.Response> sendMultipartData({
    required String endpoint,
    required HttpMethod method,
    required Map<String, String> fields,
    required String fileKey,
    required List<int> fileBytes,
    required String fileName,
  }) async {
    final uri = Uri.parse('$baseUrl/$endpoint');
    final request = http.MultipartRequest(
      method == HttpMethod.put ? 'PUT' : 'POST',
      uri,
    );
    request.fields.addAll(fields);
    request.files.add(
      http.MultipartFile.fromBytes(
        fileKey,
        fileBytes,
        filename: fileName,
      ),
    );

    try {
      final streamedResponse = await request.send();
      return await http.Response.fromStream(streamedResponse);
    } catch (e) {
      rethrow;
    }
  }
}