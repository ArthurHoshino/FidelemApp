import 'package:decimal/decimal.dart';
import 'package:drift/drift.dart' as drift;
import 'package:fidelem_app/core/data/models/produto_model.dart';
import 'package:fidelem_app/core/data/teste/cliente_home_test_data.dart';
import 'package:fidelem_app/core/data/teste/cliente_loja_test_data.dart';
import 'package:fidelem_app/database/database.dart';

/// Garante usuário e produtos de teste com IDs fixos para o carrinho local.
class DatabaseSeed {
  static const int usuarioTesteId = 1;

  static Future<void> executarSeNecessario(AppDatabase db) async {
    await _garantirUsuario(db);
    await _garantirProdutosDaLoja(db);
    await _garantirProdutosPromocoes(db);
  }

  static Future<void> garantirProduto(AppDatabase db, int produtoId) async {
    final existente = await db.cdProdutoDao.getProdutoById(produtoId);
    if (existente != null) return;

    for (final dados in ClienteLojaTestData.produtos) {
      if (dados['id'] == produtoId) {
        await _inserirProdutoMap(db, dados);
        return;
      }
    }

    for (final produto in HomeClienteTestData.promocoes) {
      if (produto.id == produtoId) {
        await _inserirProdutoModel(db, produto);
        return;
      }
    }
  }

  static Future<void> _garantirUsuario(AppDatabase db) async {
    if (await db.cdSenhaDao.getSenhaById(usuarioTesteId) != null) return;

    final empresaId = await _garantirEmpresa(db);
    final cargoId = await _garantirCargo(db, empresaId);

    await db.into(db.cdsenha).insert(
      CDSENHACompanion(
        cdSeId: const drift.Value(usuarioTesteId),
        cdSeNome: const drift.Value('Cliente Teste'),
        cdSeSenha: const drift.Value('123'),
        cdSeEmail: const drift.Value('cliente@teste.com'),
        cdSeCargoId: drift.Value(cargoId),
      ),
      mode: drift.InsertMode.insertOrIgnore,
    );
  }

  static Future<int> _garantirEmpresa(AppDatabase db) async {
    final empresas = await db.empresaDao.getAllEmpresas();
    if (empresas.isNotEmpty) return empresas.first.cdEmpId;

    return db.empresaDao.insertEmpresa(
      CDEMPRESACompanion.insert(cdEmpNome: 'Empresa Teste'),
    );
  }

  static Future<int> _garantirCargo(AppDatabase db, int empresaId) async {
    final cargos = await db.cdCargoDao.getAllCargos();
    if (cargos.isNotEmpty) return cargos.first.cdCarid;

    return db.cdCargoDao.insertCargo(
      CDCARGOCompanion.insert(
        cdCarNome: 'Cliente',
        cdCarEmpresaId: empresaId,
      ),
    );
  }

  static Future<int> _garantirCategoria(AppDatabase db) async {
    final categorias = await db.cdCategoriaDao.getAllCategorias();
    if (categorias.isNotEmpty) return categorias.first.cdCatId;

    return db.cdCategoriaDao.insertCategoria(
      CDCATEGORIACompanion.insert(cdCatNome: 'Geral'),
    );
  }

  static Future<void> _garantirProdutosDaLoja(AppDatabase db) async {
    for (final dados in ClienteLojaTestData.produtos) {
      final id = dados['id'] as int;
      if (await db.cdProdutoDao.getProdutoById(id) != null) continue;
      await _inserirProdutoMap(db, dados);
    }
  }

  static Future<void> _garantirProdutosPromocoes(AppDatabase db) async {
    for (final produto in HomeClienteTestData.promocoes) {
      if (await db.cdProdutoDao.getProdutoById(produto.id) != null) continue;
      await _inserirProdutoModel(db, produto);
    }
  }

  static Future<void> _inserirProdutoMap(
    AppDatabase db,
    Map<String, dynamic> dados,
  ) async {
    final empresaId = await _garantirEmpresa(db);
    final categoriaId = await _garantirCategoria(db);
    final id = dados['id'] as int;
    final preco = (dados['preco'] as num).toDouble();

    await db.into(db.cdproduto).insert(
      CDPRODUTOCompanion(
        cdProdId: drift.Value(id),
        cdProdNome: drift.Value(dados['nome'] as String),
        cdProdDescricao: drift.Value(dados['nome'] as String),
        cdProdPrecoReal: drift.Value(Decimal.parse(preco.toString())),
        cdProdPrecoPonto: drift.Value(dados['pontos'] as int),
        cdProdPrecoQtdEstoque: const drift.Value(99),
        cdProdEmpresaId: drift.Value(empresaId),
        cdProdCategoriaId: drift.Value(categoriaId),
      ),
      mode: drift.InsertMode.insertOrIgnore,
    );
  }

  static Future<void> _inserirProdutoModel(
    AppDatabase db,
    ProdutoModel produto,
  ) async {
    final empresaId = await _garantirEmpresa(db);
    final categoriaId = await _garantirCategoria(db);
    final precoDesconto = produto.precoDesconto;

    await db.into(db.cdproduto).insert(
      CDPRODUTOCompanion(
        cdProdId: drift.Value(produto.id),
        cdProdNome: drift.Value(produto.nome),
        cdProdDescricao: drift.Value(produto.descricao),
        cdProdPrecoReal: drift.Value(Decimal.parse(produto.precoReal.toString())),
        cdProdPrecoPonto: drift.Value(produto.precoPonto),
        cdProdPrecoDesconto: precoDesconto != null
            ? drift.Value(Decimal.parse(precoDesconto.toString()))
            : const drift.Value.absent(),
        cdProdPrecoQtdEstoque: drift.Value(produto.qtdEstoque),
        cdProdEmpresaId: drift.Value(empresaId),
        cdProdCategoriaId: drift.Value(categoriaId),
      ),
      mode: drift.InsertMode.insertOrIgnore,
    );
  }
}
