import 'package:flutter/material.dart';
import 'package:fidelem_app/core/data/teste/cliente_loja_test_data.dart';
import 'package:fidelem_app/modules/cliente/carrinho/repositories/carrinho_repository.dart';
import 'package:fidelem_app/modules/cliente/loja_pontos/loja_pontos_model.dart';

class LojaPontosViewModel extends ChangeNotifier {
  final CarrinhoRepository _carrinhoRepository = CarrinhoRepository();

  List<LojaPontosModel> products = [];
  String selectedSort = 'Mais Vendidos';

  LojaPontosViewModel() {
    init();
  }

  void init() {
    _carrinhoRepository.watchItensDoUsuario().listen((itensNoCarrinho) {
      products = ClienteLojaTestData.produtos.map((dados) {
        final id = int.tryParse(dados['id'].toString()) ?? 0;
        final quantidade =
            _carrinhoRepository.quantidadeParaProduto(itensNoCarrinho, id);

        return LojaPontosModel(
          id: dados['id'].toString(),
          nome: dados['nome'],
          preco: (dados['preco'] as num).toDouble(),
          pontos: dados['pontos'],
          imagem: dados['imagem'],
          quantidadeNoCarrinho: quantidade,
        );
      }).toList();

      notifyListeners();
    });
  }

  Future<void> updateCart(String productId, int change) async {
    final id = int.tryParse(productId) ?? -1;
    await _carrinhoRepository.atualizarQuantidade(id, change);
  }

  void setSort(String val) {
    selectedSort = val;
    notifyListeners();
  }
}
