import 'package:drift/drift.dart' as drift;
import 'package:fidelem_app/core/data/teste/database_seed.dart';
import 'package:fidelem_app/database/database.dart';

class CarrinhoRepository {
  final AppDatabase _db;
  final int userId;

  CarrinhoRepository({AppDatabase? db, int? userId})
      : _db = db ?? appDatabase,
        userId = userId ?? DatabaseSeed.usuarioTesteId;

  Stream<List<LCCARRINHOData>> watchItensDoUsuario() =>
      _db.carrinhoDao.watchCarrinhoSimplesDoUsuario(userId);

  int quantidadeParaProduto(List<LCCARRINHOData> itens, int produtoId) {
    for (final item in itens) {
      if (item.lcCarProdutoId == produtoId) {
        return item.lcCarQuantidade;
      }
    }
    return 0;
  }

  Future<void> atualizarQuantidade(int produtoId, int change) async {
    if (produtoId < 1 || change == 0) return;

    await DatabaseSeed.garantirProduto(_db, produtoId);

    final registro =
        await _db.carrinhoDao.getItemByProdutoEUsuario(produtoId, userId);

    if (registro != null) {
      final novaQtd = registro.lcCarQuantidade + change;
      if (novaQtd < 1) {
        await _db.carrinhoDao.deleteItem(registro.toCompanion(true));
      } else {
        await _db.carrinhoDao.updateItem(
          registro.toCompanion(true).copyWith(
            lcCarQuantidade: drift.Value(novaQtd),
          ),
        );
      }
    } else if (change > 0) {
      await _db.carrinhoDao.insertItem(
        LCCARRINHOCompanion(
          lcCarProdutoId: drift.Value(produtoId),
          lcCarUsuarioId: drift.Value(userId),
          lcCarQuantidade: drift.Value(change),
        ),
      );
    }
  }
}
