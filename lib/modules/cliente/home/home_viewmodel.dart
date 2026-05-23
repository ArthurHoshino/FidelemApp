import 'dart:async';
import 'dart:convert';

import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/main.dart';
import 'package:fidelem_app/core/data/teste/cliente_home_test_data.dart';
import 'package:fidelem_app/core/data/models/models.dart';
import 'package:fidelem_app/modules/cliente/carrinho/repositories/carrinho_repository.dart';
import 'package:flutter/material.dart';

part 'home_model.dart';

class HomeViewmodel extends ChangeNotifier {
  final CarrinhoRepository _carrinhoRepository = CarrinhoRepository();

  HomeModel _model = HomeModel(promocoes: HomeClienteTestData.promocoes);
  StreamSubscription? _carrinhoSubscription;

  HomeModel get model => _model;

  void init() {
    _observarCarrinho();
    carregarDadosPromocoes();
  }

  void _observarCarrinho() {
    _carrinhoSubscription?.cancel();
    _carrinhoSubscription =
        _carrinhoRepository.watchItensDoUsuario().listen((itens) {
      final quantidades = <int, int>{};
      for (final item in itens) {
        quantidades[item.lcCarProdutoId] = item.lcCarQuantidade;
      }
      _model = _model.copyWith(quantidadesCarrinho: quantidades);
      notifyListeners();
    });
  }

  Future<void> carregarDadosPromocoes() async {
    try {
      final response = await WebClient.getData(WebClient.cdProduto, queryParameters: {
        'cdprodempresaid': MyApp.empresaId ?? 1,
      });

      final promocoesData = jsonDecode(response.body);
      if (response.statusCode == 200 && promocoesData.isNotEmpty) {
        final listaPromocoes = <ProdutoModel>[];
        for (final Map<String, dynamic> item in promocoesData) {
          final produto = ProdutoModel.fromMap(item);
          if (produto != null && produto.precoDesconto != null) {
            listaPromocoes.add(produto);
          }
        }

        _model = _model.copyWith(promocoes: listaPromocoes);
      }
    } on Exception catch (e) {
      print('\x1B[1;31m Erro: ${e.toString()} \x1B[0m');
    }

    if (_model.promocoes.isEmpty) {
      _model = _model.copyWith(promocoes: HomeClienteTestData.promocoes);
    }

    notifyListeners();
  }

  Future<void> adicionarAoCarrinho(int produtoId) async {
    await _carrinhoRepository.atualizarQuantidade(produtoId, 1);
  }

  int quantidadeNoCarrinho(int produtoId) {
    return _model.quantidadesCarrinho[produtoId] ?? 0;
  }

  @override
  void dispose() {
    _carrinhoSubscription?.cancel();
    super.dispose();
  }
}
