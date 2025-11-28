// test/web_client_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:fidelem_app/core/services/web_client.dart';

void main() {
  group('Testes do WebClient', () {
    test('Deve retornar 200 ao buscar empresa (GET)', () async {
      // Executa
      final response = await WebClient.getData(
        WebClient.cdEmpresa,
        queryParameters: {'cdempid': '1'},
      );

      print('Retorno: ${response.body}');

      expect(response.statusCode, 200);
    });

    // test('Deve criar uma empresa com sucesso (POST)', () async {
    //   final response = await WebClient.sendData(
    //     endpoint: WebClient.cdEmpresa,
    //     method: HttpMethod.post,
    //     data: {'cdempnome': 'Empresa teste'},
    //   );

    //   expect(response.statusCode, 201); // Ou 200, dependendo do seu PHP
    // });
  });
}
