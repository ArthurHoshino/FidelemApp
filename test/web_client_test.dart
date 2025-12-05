import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fidelem_app/core/services/web_client.dart';

void main() {
  group('Testes do WebClient', () {
    test('Deve criar uma empresa com sucesso (POST)', () async {
      final response = await WebClient.sendData(
        endpoint: WebClient.cdEmpresa,
        method: HttpMethod.post,
        data: {'cdempnome': 'Empresa teste'},
      );

      expect(response.statusCode, 201);
    });
    test('Deve retornar 200 ao buscar empresa (GET)', () async {
      // Executa
      final response = await WebClient.getData(
        WebClient.cdEmpresa,
        queryParameters: {'cdempnome': 'Empresa teste'},
      );

      print('Retorno: ${response.body}');

      expect(response.statusCode, 200);
    });

    test('Deve atualizar uma empresa com sucesso (PUT)', () async {
      final busca = await WebClient.getData(
        WebClient.cdEmpresa,
        queryParameters: {'cdempnome': 'Empresa teste'},
      );

      final idEmpresa = busca.body.isNotEmpty ? jsonDecode(busca.body)[0]['CDEMPID'] : 1;

      final response = await WebClient.sendData(
        endpoint: WebClient.cdEmpresa,
        method: HttpMethod.put,
        data: {'cdempid': idEmpresa, 'cdempnome': 'Empresa atualizada'},
      );

      expect(response.statusCode, 204);
    });

    test('Deve criar um novo cargo com sucesso (POST)', () async {
      final busca = await WebClient.getData(
        WebClient.cdEmpresa,
        queryParameters: {'cdempnome': 'Empresa atualizada'},
      );

      final idEmpresa = busca.body.isNotEmpty ? jsonDecode(busca.body)[0]['CDEMPID'] : 1;

      final response = await WebClient.sendData(
        endpoint: WebClient.cdCargo,
        method: HttpMethod.post,
        data: {'cdcarnome': 'Cargo teste', 'cdcarempresaid': idEmpresa},
      );

      expect(response.statusCode, 201);
    });

    test('Deve retornar 200 ao buscar cargo (GET)', () async {
      final busca = await WebClient.getData(
        WebClient.cdEmpresa,
        queryParameters: {'cdempnome': 'Empresa atualizada'},
      );

      final idEmpresa = busca.body.isNotEmpty ? jsonDecode(busca.body)[0]['CDEMPID'] : 1;

      final response = await WebClient.getData(
        WebClient.cdCargo,
        queryParameters: {'cdcarnome': 'Cargo teste', 'empresa': idEmpresa},
      );

      print('Retorno: ${response.body}');

      expect(response.statusCode, 200);
    });

    test('Deve atualizar um cargo com sucesso (PUT)', () async {
      final buscaEmpresa = await WebClient.getData(
        WebClient.cdEmpresa,
        queryParameters: {'cdempnome': 'Empresa atualizada'},
      );

      final idEmpresa = buscaEmpresa.body.isNotEmpty ? jsonDecode(buscaEmpresa.body)[0]['CDEMPID'] : 1;

      final busca = await WebClient.getData(
        WebClient.cdCargo,
        queryParameters: {'cdcarnome': 'Cargo teste', 'empresa': idEmpresa},
      );

      final idCargo = busca.body.isNotEmpty ? jsonDecode(busca.body)[0]['CDCARID'] : 1;

      final response = await WebClient.sendData(
        endpoint: WebClient.cdCargo,
        method: HttpMethod.put,
        data: {'cdcarid': idCargo, 'cdcarnome': 'Cargo atualizado', 'cdcarempresaid': idEmpresa},
      );

      expect(response.statusCode, 204);
    });

    test('Deve criar uma senha com sucesso (POST)', () async {
      final buscaEmpresa = await WebClient.getData(
        WebClient.cdEmpresa,
        queryParameters: {'cdempnome': 'Empresa atualizada'},
      );

      final idEmpresa = buscaEmpresa.body.isNotEmpty ? jsonDecode(buscaEmpresa.body)[0]['CDEMPID'] : 1;

      final busca = await WebClient.getData(
        WebClient.cdCargo,
        queryParameters: {'cdcarnome': 'Cargo atualizado', 'empresa' : idEmpresa},
      );

      final idCargo = busca.body.isNotEmpty ? jsonDecode(busca.body)[0]['CDCARID'] : 1;

      final response = await WebClient.sendData(
        endpoint: WebClient.cdSenha,
        method: HttpMethod.post,
        data: {'cdsenome': 'Usuario teste', 'cdsesenha': 'senha123', 'cdsecpfcnpj': '12345678901', 'cdseemail': 'emailteste@gmail.com', 'cdsetelefone': '11987654321', 'cdsecargoid': idCargo},
      );

      expect(response.statusCode, 204);
    });

    test('Deve retornar 200 ao buscar senha (GET)', () async {
      final busca = await WebClient.getData(
        WebClient.cdEmpresa,
        queryParameters: {'cdempnome': 'Empresa atualizada'},
      );

      final idEmpresa = busca.body.isNotEmpty ? jsonDecode(busca.body)[0]['CDEMPID'] : 1;

      final buscaCargo = await WebClient.getData(
        WebClient.cdCargo,
        queryParameters: {'cdcarnome': 'Cargo atualizado', 'empresa' : idEmpresa},
      );

      final idCargo = buscaCargo.body.isNotEmpty ? jsonDecode(buscaCargo.body)[0]['CDCARID'] : 1;

      final response = await WebClient.getData(
        WebClient.cdSenha,
        queryParameters: {'cdsenome': 'Usuario teste', 'cdsecargoid': idCargo, 'empresa': idEmpresa},
      );

      print('Retorno: ${response.body}');

      expect(response.statusCode, 200);
    });

    test('Deve atualizar uma senha com sucesso (PUT)', () async {
      final buscaEmpresa = await WebClient.getData(
        WebClient.cdEmpresa,
        queryParameters: {'cdempnome': 'Empresa atualizada'},
      );

      final idEmpresa = buscaEmpresa.body.isNotEmpty ? jsonDecode(buscaEmpresa.body)[0]['CDEMPID'] : 1;

      final busca = await WebClient.getData(
        WebClient.cdSenha,
        queryParameters: {'cdsenome': 'Usuario teste', 'empresa': idEmpresa},
      );

      final idSenha = busca.body.isNotEmpty ? jsonDecode(busca.body)[0]['CDSEID'] : 1;

      final buscaCargo = await WebClient.getData(
        WebClient.cdCargo,
        queryParameters: {'cdcarnome': 'Cargo atualizado', 'empresa' : idEmpresa},
      );

      final idCargo = buscaCargo.body.isNotEmpty ? jsonDecode(buscaCargo.body)[0]['CDCARID'] : 1;

      final response = await WebClient.sendData(
        endpoint: WebClient.cdSenha,
        method: HttpMethod.put,
        data: {'cdseid': idSenha, 'cdsenome': 'Usuario atualizado', 'cdsesenha': 'senhaAtualizada123', 'cdsecpfcnpj': '12345678901', 'cdseemail': 'emailAtualizado@gmail.com', 'cdsetelefone': '119876543215', 'cdsecargoid': idCargo},
      );
      expect(response.statusCode, 201);
    });

    test('Deve deletar uma senha com sucesso (DELETE)', () async {
      final buscaEmpresa = await WebClient.getData(
        WebClient.cdEmpresa,
        queryParameters: {'cdempnome': 'Empresa atualizada'},
      );

      final idEmpresa = buscaEmpresa.body.isNotEmpty ? jsonDecode(buscaEmpresa.body)[0]['CDEMPID'] : 1;

      final busca = await WebClient.getData(
        WebClient.cdSenha,
        queryParameters: {'cdsenome': 'Usuario atualizado', 'empresa':idEmpresa},
      );

      final idSenha = busca.body.isNotEmpty ? jsonDecode(busca.body)[0]['CDSEID'] : 1;

      final response = await WebClient.sendData(
        endpoint: WebClient.cdSenha,
        method: HttpMethod.delete,
        data: {'cdseid': idSenha},
      );

      expect(response.statusCode, 204);
    });

    test('Deve deletar um cargo com sucesso (DELETE)', () async {
      final buscaEmpresa = await WebClient.getData(
        WebClient.cdEmpresa,
        queryParameters: {'cdempnome': 'Empresa atualizada'},
      );

      final idEmpresa = buscaEmpresa.body.isNotEmpty ? jsonDecode(buscaEmpresa.body)[0]['CDEMPID'] : 1;

      final busca = await WebClient.getData(
        WebClient.cdCargo,
        queryParameters: {'cdcarnome': 'Cargo atualizado', 'empresa' : idEmpresa},
      );

      final idCargo = busca.body.isNotEmpty ? jsonDecode(busca.body)[0]['CDCARID'] : 1;

      final response = await WebClient.sendData(
        endpoint: WebClient.cdCargo,
        method: HttpMethod.delete,
        data: {'cdcarid': idCargo, 'cdcarempresaid': idEmpresa},
      );

      expect(response.statusCode, 204);
    });

    test('Deve deletar uma empresa com sucesso (DELETE)', () async {
      final busca = await WebClient.getData(
        WebClient.cdEmpresa,
        queryParameters: {'cdempnome': 'Empresa atualizada'},
      );

      final idEmpresa = busca.body.isNotEmpty ? jsonDecode(busca.body)[0]['CDEMPID'] : 1;

      final response = await WebClient.sendData(
        endpoint: WebClient.cdEmpresa,
        method: HttpMethod.delete,
        data: {'cdempid': idEmpresa},
      );

      expect(response.statusCode, 204);
    });
  });
}
