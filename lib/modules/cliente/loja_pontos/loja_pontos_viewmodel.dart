import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:fidelem_app/database/database.dart';
import 'package:fidelem_app/core/data/teste/cliente_loja_test_data.dart';
import 'package:fidelem_app/modules/cliente/loja_pontos/loja_pontos_model.dart';

class LojaPontosViewModel extends ChangeNotifier {
  final AppDatabase db = appDatabase;
  final int userId = 1;

  List<LojaPontosModel> products = [];
  String selectedSort = 'Mais Vendidos';

  LojaPontosViewModel() {
    init();
  }

  void init() {
    db.carrinhoDao.watchCarrinhoSimplesDoUsuario(userId).listen((itensNoCarrinho) {
      products = ClienteLojaTestData.produtos.map((dados) {
        final id = int.tryParse(dados['id'].toString()) ?? 0;
        
        LCCARRINHOData? itemNoCarrinho; 
        for (var c in itensNoCarrinho) {
          if (c.lcCarProdutoId == id) {
            itemNoCarrinho = c;
            break;
          }
        }

        return LojaPontosModel(
          id: dados['id'].toString(),
          nome: dados['nome'],
          preco: (dados['preco'] as num).toDouble(),
          pontos: dados['pontos'],
          imagem: dados['imagem'],
          quantidadeNoCarrinho: itemNoCarrinho?.lcCarQuantidade ?? 0,
        );
      }).toList();

      notifyListeners();
    });
  }

  Future<void> updateCart(String productId, int change) async {
    final id = int.tryParse(productId) ?? -1;
    
    final registro = await db.carrinhoDao.getItemByProdutoEUsuario(id, userId);

    if (registro != null) {
      int novaQtd = registro.lcCarQuantidade + change;
      
      if (novaQtd < 1) {
        await db.carrinhoDao.deleteItem(registro.toCompanion(true));
      } else {
        await db.carrinhoDao.updateItem(
          registro.toCompanion(true).copyWith(lcCarQuantidade: drift.Value(novaQtd))
        );
      }
    } else if (change == 1) {
      await db.carrinhoDao.insertItem(LCCARRINHOCompanion(
        lcCarProdutoId: drift.Value(id),
        lcCarUsuarioId: drift.Value(userId),
        lcCarQuantidade: const drift.Value(1),
      ));
    }
  }

  void setSort(String val) {
    selectedSort = val;
    notifyListeners();
  }
}