import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:fidelem_app/core/data/teste/cliente_loja_test_data.dart';
import 'package:fidelem_app/modules/cliente/carrinho/repositories/carrinho_repository.dart';
import '../models/carrinho_model.dart';

class CarrinhoViewModel extends ChangeNotifier {
  final CarrinhoRepository _carrinhoRepository = CarrinhoRepository();

  List<CarrinhoModel> items = [];

  CarrinhoViewModel() {
    init();
  }

  void init() {
    _carrinhoRepository.watchItensDoUsuario().listen((itensNoBanco) {
      final listaTemporaria = <CarrinhoModel>[];
      final produtosDaLoja = ClienteLojaTestData.produtos;

      for (final itemNoBanco in itensNoBanco) {
        Map<String, dynamic>? dadosEncontrados;

        for (final produto in produtosDaLoja) {
          if (produto['id'] == itemNoBanco.lcCarProdutoId) {
            dadosEncontrados = produto;
            break;
          }
        }

        if (dadosEncontrados != null) {
          final modelo = CarrinhoModel.montarComDadosLoja(
            carrinhoData: itemNoBanco,
            dadosProduto: dadosEncontrados,
          );
          if (modelo != null) listaTemporaria.add(modelo);
        }
      }

      items = listaTemporaria;
      notifyListeners();
    });
  }

  void adicionar(CarrinhoModel item) => _update(item, 1);
  void remover(CarrinhoModel item) => _update(item, -1);

  void excluir(CarrinhoModel item) {
    _carrinhoRepository.atualizarQuantidade(item.id, -item.carrinhoData.lcCarQuantidade);
  }

  void _update(CarrinhoModel item, int change) {
    _carrinhoRepository.atualizarQuantidade(item.id, change);
  }

  Decimal get total {
    Decimal valorTotal = Decimal.zero;
    for (var item in items) {
      final preco = Decimal.parse(item.preco.toString());
      valorTotal += preco * Decimal.fromInt(item.carrinhoData.lcCarQuantidade);
    }
    return valorTotal;
  }
}
