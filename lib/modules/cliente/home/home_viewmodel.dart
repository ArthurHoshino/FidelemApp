import 'dart:convert';

import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/main.dart';
import 'package:fidelem_app/core/data/teste/cliente_home_test_data.dart';
import 'package:fidelem_app/core/data/models/models.dart';
import 'package:flutter/material.dart';

part 'home_model.dart';

class HomeViewmodel extends ChangeNotifier {
  HomeModel _model = HomeModel();

  HomeModel get model => _model;

  void init() {
    carregarDadosPromocoes();
  }

  Future<void> carregarDadosPromocoes() async {
    try {
      final response = await WebClient.getData(WebClient.cdProduto, queryParameters: {
        'cdprodempresaid': MyApp.empresaId ?? 1, // TODO: tirar o safe call para entregar. Colocado apenas para testes
      });

      final promocoesData = jsonDecode(response.body);
      if (response.statusCode == 200 && promocoesData.isNotEmpty) {
        List<ProdutoModel> listaPromocoes = [];
        for (Map<String, dynamic> item in promocoesData) {
          final produto = ProdutoModel.fromMap(item);
          if (produto != null && produto.precoDesconto != null) {
            listaPromocoes.add(ProdutoModel.fromMap(item)!);
          }
        }

        _model = _model.copyWith(
          promocoes: listaPromocoes,
        );
      }
    } on Exception catch (e) {
      print('\x1B[1;31m Erro: ${e.toString()} \x1B[0m');
    }

    notifyListeners();
  }
}