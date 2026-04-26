import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:decimal/decimal.dart';
import 'package:fidelem_app/database/database.dart';
import 'package:fidelem_app/core/data/teste/cliente_loja_test_data.dart';
import '../models/carrinho_model.dart';

class CarrinhoViewModel extends ChangeNotifier {
  final AppDatabase db = appDatabase;
  final int userId = 1;

  List<CarrinhoModel> items = [];

  CarrinhoViewModel() {
    init();
  }

 void init() {
  db.carrinhoDao.watchCarrinhoSimplesDoUsuario(userId).listen((itensNoBanco) {
    List<CarrinhoModel> listaTemporaria = [];
    final produtosDaLoja = ClienteLojaTestData.produtos;

    for (var itemNoBanco in itensNoBanco) {
      Map<String, dynamic>? dadosEncontrados;
      
      for (var produto in produtosDaLoja) {
        if (produto['id'] == itemNoBanco.lcCarProdutoId) {
          dadosEncontrados = produto;
          break;
        }
      }

      if (dadosEncontrados != null) {
        final modeloParaExibir = CarrinhoModel(
          carrinhoData: itemNoBanco,
          nome: dadosEncontrados['nome'],
          preco: (dadosEncontrados['preco'] as num).toDouble(),
          imagem: dadosEncontrados['imagem'],
        );

        listaTemporaria.add(modeloParaExibir);
      }
    }
    items = listaTemporaria;
    notifyListeners();
  });
}

  void adicionar(CarrinhoModel item) => _update(item, 1);
  void remover(CarrinhoModel item) => _update(item, -1);
  
  void excluir(CarrinhoModel item) {
    db.carrinhoDao.deleteItem(item.carrinhoData.toCompanion(true));
  }

  void _update(CarrinhoModel item, int change) {
    int novaQtd = item.carrinhoData.lcCarQuantidade + change;
    if (novaQtd < 1) {
      excluir(item);
    } else {
      db.carrinhoDao.updateItem(
        item.carrinhoData.toCompanion(true).copyWith(
          lcCarQuantidade: drift.Value(novaQtd),
        ),
      );
    }
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