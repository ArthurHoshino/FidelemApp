// ignore_for_file: slash_for_doc_comments

import 'package:drift/drift.dart';
import 'package:decimal/decimal.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

// Este conversor armazena o Decimal como uma String no banco de dados.
class DecimalConverter extends TypeConverter<Decimal, String> {
  const DecimalConverter();

  @override
  Decimal fromSql(String fromDb) {
    // Converte a String do banco de dados de volta para Decimal
    return Decimal.parse(fromDb);
  }

  @override
  String toSql(Decimal value) {
    // Converte o Decimal do seu app para uma String
    return value.toString();
  }
}

/**
 * Definindo banco de dados
 */
@DriftDatabase(
  tables: [
    CDEMPRESA, 
    CDCARGO, 
    CDSENHA, 
    FIDELSESSAO, 
    LCVENDA, 
    CDPRODUTO, 
    CDCATEGORIA, 
    CDPRODUTOIMAGEM, 
    CDEXCECAO, 
    CDACAO, 
    LCAUDITORIA,
    LCCARRINHO,
  ], 
  daos: [
    CDEMPRESADAO, 
    CDCARGODAO,
    CDSENHADAO,
    FIDELSESSAODAO,
    LCVENDADAO,
    CDPRODUTODAO,
    CDCATEGORIADAO,
    CDPRODUTOIMAGEMDAO,
    CDEXCECAODAO,
    CDACAODAO,
    LCAUDITORIADAO,
    LCCARRINHODAO,
  ]
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  
  /**
   * Construtor para testes
   */
  // AppDatabase.test(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
  
  /**
   * Getter para os DAOs
   */
  CDEMPRESADAO get empresaDao => cdempresadao;
  FIDELSESSAODAO get fidelSessaoDao => fidelsessaodao;
  CDCARGODAO get cdCargoDao => cdcargodao;
  LCVENDADAO get lcVendaDao => lcvendadao;
  CDSENHADAO get cdSenhaDao => cdsenhadao;
  CDPRODUTODAO get cdProdutoDao => cdprodutodao;
  CDCATEGORIADAO get cdCategoriaDao => cdcategoriadao;
  CDPRODUTOIMAGEMDAO get cdProdutoImagemDao => cdprodutoimagemdao;
  CDEXCECAODAO get cdExcecaoDao => cdexcecaodao;
  CDACAODAO get cdAcaoDao => cdacaodao;
  LCAUDITORIADAO get lcAuditoriaDao => lcauditoriadao;
  LCCARRINHODAO get carrinhoDao => lccarrinhodao;
}

LazyDatabase _openConnection() {
  // a LazyDatabase abre a conexão apenas quando necessário
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}



/**
 * Definindo as tabelas
 */
class CDEMPRESA extends Table {
  IntColumn get cdEmpId => integer().named('CDEMPID').autoIncrement()();
  TextColumn get cdEmpNome => text().named('CDEMPNOME').withLength(min: 1, max: 45)();
}

class CDCARGO extends Table {
  IntColumn get cdCarid => integer().named('CDCARID').autoIncrement()();
  TextColumn get cdCarNome => text().named('CDCARNOME').withLength(min: 1, max: 45)();
  IntColumn get cdCarEmpresaId => integer().named('CDCAREMPRESAID').references(CDEMPRESA, #cdEmpId)();
}

class CDSENHA extends Table {
  IntColumn get cdSeId => integer().named('CDSEID').autoIncrement()();
  TextColumn get cdSeNome => text().named('CDSENOME').withLength(min: 1, max: 255)();
  TextColumn get cdSeSenha => text().named('CDSESENHA').withLength(min: 1, max: 255)();
  TextColumn get cdSeCpfCnpj => text().named('CDSECPFCNPJ').nullable().withLength(min: 1, max: 14)();
  TextColumn get cdSeEmail => text().named('CDSEEMAIL').withLength(min: 1, max: 255)();
  TextColumn get cdSeTelefone => text().named('CDSETELEFONE').nullable().withLength(min: 1, max: 45)();
  IntColumn get cdSeCargoId  => integer().named('CDSECARGOID').references(CDCARGO, #cdCarid)();
}

class FIDELSESSAO extends Table {
  IntColumn get fidelSesId => integer().named('FIDELSESID').autoIncrement()();
  IntColumn get fidelSesExpira  => integer().named('FIDELSESEXPIRA')();
  DateTimeColumn get fidelSesDtSessao => dateTime().named('FIDELSESDTSESSAO')();
  IntColumn get fidelSesSenhaId  => integer().named('FIDELSESSENHAID').references(CDSENHA, #cdSeId)();
}

class LCVENDA extends Table {
  IntColumn get lcVenId => integer().named('LCVENID').autoIncrement()();
  IntColumn get lcVenSenhaId  => integer().named('LCVENSENHAID').references(CDSENHA, #cdSeId)();
  TextColumn get lcVenProdutos => text().named('LCVENPRODUTOS')();
  DateTimeColumn get lcvenData => dateTime().named('LCVENDATA')();
}

class CDPRODUTO extends Table {
  IntColumn get cdProdId => integer().named('CDPRODID').autoIncrement()();
  TextColumn get cdProdNome => text().named('CDPRODNOME').withLength(min: 1, max: 45)();
  TextColumn get cdProdDescricao => text().named('CDPRODDESCRICAO').withLength(min: 1, max: 45)();
  Column<String> get cdProdPrecoReal => text().map(const DecimalConverter()).named('CDPRODPRECOREAL').withDefault(Constant(Decimal.zero.toString()))();
  IntColumn get cdProdPrecoPonto => integer().named('CDPRODPRECOPONTO')();
  Column<String> get cdProdPrecoDesconto => text().map(const DecimalConverter()).named('CDPRODPRECODESCONTO').withDefault(Constant(Decimal.zero.toString()))();
  IntColumn get cdProdPrecoQtdEstoque => integer().named('CDPRODQTDESTOQUE')();
  IntColumn get cdProdEmpresaId => integer().named('CDPRODEMPRESAID').references(CDEMPRESA, #cdEmpId)();
  IntColumn get cdProdCategoriaId => integer().named('CDPRODCATEGORIAID').references(CDCATEGORIA, #cdCatId)();
}

class CDCATEGORIA extends Table {
  IntColumn get cdCatId => integer().named('CDCATID').autoIncrement()();
  TextColumn get cdCatNome => text().named('CDCATNOME').withLength(min: 1, max: 45)();
}

class CDPRODUTOIMAGEM extends Table {
  IntColumn get cdProdImgId => integer().named('CDPRODIMGID').autoIncrement()();
  BlobColumn get cdProdImgBlob => blob().named('CDPRODIMGBLOB')();
  IntColumn get cdProdImgProdutoId => integer().named('CDPRODIMGPRODUTOID').references(CDPRODUTO, #cdProdId)();
}

class CDEXCECAO extends Table {
  IntColumn get cdExId => integer().named('CDEXID').autoIncrement()();
  TextColumn get cdExDescricao => text().named('CDEXDESCRICAO').withLength(min: 1, max: 200)();
  DateTimeColumn get cdExData => dateTime().named('CDEXDATA')();
  IntColumn get cdExEmpresaId => integer().named('CDEXEMPRESAID').references(CDEMPRESA, #cdEmpId)();
}

class CDACAO extends Table {
  IntColumn get cdAcaoId => integer().named('CDACAOID').autoIncrement()();
  TextColumn get cdAcaoDescricao => text().named('CDACAODESCRICAO').withLength(min: 1, max: 45)();
}

class LCAUDITORIA extends Table {
  IntColumn get lcAudId => integer().named('LCAUDID').autoIncrement()();
  TextColumn get lcAudDescricao => text().named('LCAUDDESCRICAO').withLength(min: 1, max: 100)();
  DateTimeColumn get lcAudData => dateTime().named('LCAUDDATA')();
  IntColumn get lcAudAcaoId => integer().named('LCAUDACAOID').references(CDACAO, #cdAcaoId)();
  IntColumn get lcAudEmpresaId => integer().named('LCAUDEMPRESAID').references(CDEMPRESA, #cdEmpId)();
}

class LCCARRINHO extends Table {
  IntColumn get lcCarId => integer().named('LCCARID').autoIncrement()();
  IntColumn get lcCarProdutoId => integer().named('LCCARPRODUTOID').references(CDPRODUTO, #cdProdId)();
  IntColumn get lcCarUsuarioId => integer().named('LCCARUSUARIOID').references(CDSENHA, #cdSeId)();
  IntColumn get lcCarQuantidade => integer().named('LCCARQUANTIDADE')();
}

class CarrinhoCompleto {
  final LCCARRINHOData carrinho;
  final CDPRODUTOData produto;
  CarrinhoCompleto({required this.carrinho, required this.produto});
}



/**
 * Data Access Objects (DAOs)
 */

@DriftAccessor(tables: [CDEMPRESA])
class CDEMPRESADAO extends DatabaseAccessor<AppDatabase> with _$CDEMPRESADAOMixin {
  final AppDatabase db;

  // O construtor é chamado pelo AppDatabase
  CDEMPRESADAO(this.db) : super(db);

  Future<List<CDEMPRESAData>> getAllEmpresas() => select(cdempresa).get();
  Stream<List<CDEMPRESAData>> watchAllEmpresas() => select(cdempresa).watch();
  Future<CDEMPRESAData?> getEmpresaById(int id) {
    return (select(cdempresa)..where((tbl) => tbl.cdEmpId.equals(id)))
        .getSingleOrNull();
  }
  Stream<CDEMPRESAData?> watchEmpresaById(int id) {
    return (select(cdempresa)..where((tbl) => tbl.cdEmpId.equals(id)))
        .watchSingleOrNull();
  }
  Future<int> insertEmpresa(CDEMPRESACompanion empresa) => into(cdempresa).insert(empresa);
  Future<bool> updateEmpresa(CDEMPRESACompanion empresa) => update(cdempresa).replace(empresa);
  Future<int> deleteEmpresa(CDEMPRESACompanion empresa) => delete(cdempresa).delete(empresa);
}

@DriftAccessor(tables: [FIDELSESSAO])
class FIDELSESSAODAO extends DatabaseAccessor<AppDatabase> with _$FIDELSESSAODAOMixin {
  final AppDatabase db;

  // O construtor é chamado pelo AppDatabase
  FIDELSESSAODAO(this.db) : super(db);

  Future<List<FIDELSESSAOData>> getAllSessoes() => select(fidelsessao).get();
  Stream<List<FIDELSESSAOData>> watchAllSessoes() => select(fidelsessao).watch();
  Future<FIDELSESSAOData?> getSessaoById(int id) {
    return (select(fidelsessao)..where((tbl) => tbl.fidelSesId.equals(id)))
        .getSingleOrNull();
  }
  Stream<FIDELSESSAOData?> watchSessaoById(int id) {
    return (select(fidelsessao)..where((tbl) => tbl.fidelSesId.equals(id)))
        .watchSingleOrNull();
  }
  Future<int> insertSessao(FIDELSESSAOCompanion sessao) => into(fidelsessao).insert(sessao);
  Future<bool> updateSessao(FIDELSESSAOCompanion sessao) => update(fidelsessao).replace(sessao);
  Future<int> deleteSessao(FIDELSESSAOCompanion sessao) => delete(fidelsessao).delete(sessao);
}

@DriftAccessor(tables: [CDCARGO])
class CDCARGODAO extends DatabaseAccessor<AppDatabase> with _$CDCARGODAOMixin {
  final AppDatabase db;

  // O construtor é chamado pelo AppDatabase
  CDCARGODAO(this.db) : super(db);

  Future<List<CDCARGOData>> getAllCargos() => select(cdcargo).get();
  Stream<List<CDCARGOData>> watchAllCargos() => select(cdcargo).watch();
  Future<CDCARGOData?> getCargosById(int id) {
    return (select(cdcargo)..where((tbl) => tbl.cdCarid.equals(id)))
        .getSingleOrNull();
  }
  Stream<CDCARGOData?> watchCargosById(int id) {
    return (select(cdcargo)..where((tbl) => tbl.cdCarid.equals(id)))
        .watchSingleOrNull();
  }
  Future<int> insertCargo(CDCARGOCompanion cargo) => into(cdcargo).insert(cargo);
  Future<bool> updateCargo(CDCARGOCompanion cargo) => update(cdcargo).replace(cargo);
  Future<int> deleteCargo(CDCARGOCompanion cargo) => delete(cdcargo).delete(cargo);
}

@DriftAccessor(tables: [LCVENDA])
class LCVENDADAO extends DatabaseAccessor<AppDatabase> with _$LCVENDADAOMixin {
  final AppDatabase db;

  // O construtor é chamado pelo AppDatabase
  LCVENDADAO(this.db) : super(db);

  Future<List<LCVENDAData>> getAllVendas() => select(lcvenda).get();
  Stream<List<LCVENDAData>> watchAllVendas() => select(lcvenda).watch();
  Future<List<LCVENDAData?>> getVendaById(int id) {
    return (select(lcvenda)..where((tbl) => tbl.lcVenId.equals(id)))
        .get();
  }
  Stream<List<LCVENDAData?>> watchVendaById(int id) {
    return (select(lcvenda)..where((tbl) => tbl.lcVenId.equals(id)))
        .watch();
  }
  Future<int> insertVenda(LCVENDACompanion venda) => into(lcvenda).insert(venda);
  Future<bool> updateVenda(LCVENDACompanion venda) => update(lcvenda).replace(venda);
  Future<int> deleteVenda(LCVENDACompanion venda) => delete(lcvenda).delete(venda);
}

@DriftAccessor(tables: [CDSENHA])
class CDSENHADAO extends DatabaseAccessor<AppDatabase> with _$CDSENHADAOMixin {
  final AppDatabase db;

  // O construtor é chamado pelo AppDatabase
  CDSENHADAO(this.db) : super(db);

  Future<List<CDSENHAData>> getAllSenhas() => select(cdsenha).get();
  Stream<List<CDSENHAData>> watchAllSenhas() => select(cdsenha).watch();
  Future<CDSENHAData?> getSenhaById(int id) {
    return (select(cdsenha)..where((tbl) => tbl.cdSeId.equals(id)))
        .getSingleOrNull();
  }
  Stream<CDSENHAData?> watchSenhaById(int id) {
    return (select(cdsenha)..where((tbl) => tbl.cdSeId.equals(id)))
        .watchSingleOrNull();
  }
  Future<int> insertSenha(CDSENHACompanion senha) => into(cdsenha).insert(senha);
  Future<bool> updateSenha(CDSENHACompanion senha) => update(cdsenha).replace(senha);
  Future<int> deleteSenha(CDSENHACompanion senha) => delete(cdsenha).delete(senha);
}

@DriftAccessor(tables: [CDPRODUTO])
class CDPRODUTODAO extends DatabaseAccessor<AppDatabase> with _$CDPRODUTODAOMixin {
  final AppDatabase db;

  // O construtor é chamado pelo AppDatabase
  CDPRODUTODAO(this.db) : super(db);

  Future<List<CDPRODUTOData>> getAllProdutos() => select(cdproduto).get();
  Stream<List<CDPRODUTOData>> watchAllProdutos() => select(cdproduto).watch();
  Future<CDPRODUTOData?> getProdutoById(int id) {
    return (select(cdproduto)..where((tbl) => tbl.cdProdId.equals(id)))
        .getSingleOrNull();
  }
  Stream<CDPRODUTOData?> watchProdutoById(int id) {
    return (select(cdproduto)..where((tbl) => tbl.cdProdId.equals(id)))
        .watchSingleOrNull();
  }
  Future<int> insertProduto(CDPRODUTOCompanion produto) => into(cdproduto).insert(produto);
  Future<bool> updateProduto(CDPRODUTOCompanion produto) => update(cdproduto).replace(produto);
  Future<int> deleteProduto(CDPRODUTOCompanion produto) => delete(cdproduto).delete(produto);
}

@DriftAccessor(tables: [CDCATEGORIA])
class CDCATEGORIADAO extends DatabaseAccessor<AppDatabase> with _$CDCATEGORIADAOMixin {
  final AppDatabase db;

  // O construtor é chamado pelo AppDatabase
  CDCATEGORIADAO(this.db) : super(db);

  Future<List<CDCATEGORIAData>> getAllCategorias() => select(cdcategoria).get();
  Stream<List<CDCATEGORIAData>> watchAllCategorias() => select(cdcategoria).watch();
  Future<CDCATEGORIAData?> getCategoriaById(int id) {
    return (select(cdcategoria)..where((tbl) => tbl.cdCatId.equals(id)))
        .getSingleOrNull();
  }
  Stream<CDCATEGORIAData?> watchCategoriaById(int id) {
    return (select(cdcategoria)..where((tbl) => tbl.cdCatId.equals(id)))
        .watchSingleOrNull();
  }
  Future<int> insertCategoria(CDCATEGORIACompanion categoria) => into(cdcategoria).insert(categoria);
  Future<bool> updateCategoria(CDCATEGORIACompanion categoria) => update(cdcategoria).replace(categoria);
  Future<int> deleteCategoria(CDCATEGORIACompanion categoria) => delete(cdcategoria).delete(categoria);
}

@DriftAccessor(tables: [CDPRODUTOIMAGEM])
class CDPRODUTOIMAGEMDAO extends DatabaseAccessor<AppDatabase> with _$CDPRODUTOIMAGEMDAOMixin {
  final AppDatabase db;

  // O construtor é chamado pelo AppDatabase
  CDPRODUTOIMAGEMDAO(this.db) : super(db);

  Future<List<CDPRODUTOIMAGEMData>> getAllImagens() => select(cdprodutoimagem).get();
  Stream<List<CDPRODUTOIMAGEMData>> watchAllImagens() => select(cdprodutoimagem).watch();
  Future<List<CDPRODUTOIMAGEMData?>> getImagemById(int id) {
    return (select(cdprodutoimagem)..where((tbl) => tbl.cdProdImgId.equals(id)))
        .get();
  }
  Stream<List<CDPRODUTOIMAGEMData?>> watchImagemById(int id) {
    return (select(cdprodutoimagem)..where((tbl) => tbl.cdProdImgId.equals(id)))
        .watch();
  }
  Future<int> insertImagem(CDPRODUTOIMAGEMCompanion produtoimagem) => into(cdprodutoimagem).insert(produtoimagem);
  Future<bool> updateImagem(CDPRODUTOIMAGEMCompanion produtoimagem) => update(cdprodutoimagem).replace(produtoimagem);
  Future<int> deleteImagem(CDPRODUTOIMAGEMCompanion produtoimagem) => delete(cdprodutoimagem).delete(produtoimagem);
}

@DriftAccessor(tables: [CDEXCECAO])
class CDEXCECAODAO extends DatabaseAccessor<AppDatabase> with _$CDEXCECAODAOMixin {
  final AppDatabase db;

  // O construtor é chamado pelo AppDatabase
  CDEXCECAODAO(this.db) : super(db);

  Future<List<CDEXCECAOData>> getAllExcecoes() => select(cdexcecao).get();
  Stream<List<CDEXCECAOData>> watchAllExcecoes() => select(cdexcecao).watch();
  Future<List<CDEXCECAOData?>> getExcecaoById(int id) {
    return (select(cdexcecao)..where((tbl) => tbl.cdExId.equals(id)))
        .get();
  }
  Stream<List<CDEXCECAOData?>> watchExcecaoById(int id) {
    return (select(cdexcecao)..where((tbl) => tbl.cdExId.equals(id)))
        .watch();
  }
  Future<int> insertExcecao(CDEXCECAOCompanion excecao) => into(cdexcecao).insert(excecao);
  Future<bool> updateExcecao(CDEXCECAOCompanion excecao) => update(cdexcecao).replace(excecao);
  Future<int> deleteExcecao(CDEXCECAOCompanion excecao) => delete(cdexcecao).delete(excecao);
}

@DriftAccessor(tables: [CDACAO])
class CDACAODAO extends DatabaseAccessor<AppDatabase> with _$CDACAODAOMixin {
  final AppDatabase db;

  // O construtor é chamado pelo AppDatabase
  CDACAODAO(this.db) : super(db);

  Future<List<CDACAOData>> getAllAcoes() => select(cdacao).get();
  Stream<List<CDACAOData>> watchAllAcoes() => select(cdacao).watch();
  Future<List<CDACAOData?>> getAcaoById(int id) {
    return (select(cdacao)..where((tbl) => tbl.cdAcaoId.equals(id)))
        .get();
  }
  Stream<List<CDACAOData?>> watchAcaoById(int id) {
    return (select(cdacao)..where((tbl) => tbl.cdAcaoId.equals(id)))
        .watch();
  }
  Future<int> insertAcao(CDACAOCompanion acao) => into(cdacao).insert(acao);
  Future<bool> updateAcao(CDACAOCompanion acao) => update(cdacao).replace(acao);
  Future<int> deleteAcao(CDACAOCompanion acao) => delete(cdacao).delete(acao);
}

@DriftAccessor(tables: [LCAUDITORIA])
class LCAUDITORIADAO extends DatabaseAccessor<AppDatabase> with _$LCAUDITORIADAOMixin {
  final AppDatabase db;

  // O construtor é chamado pelo AppDatabase
  LCAUDITORIADAO(this.db) : super(db);

  Future<List<LCAUDITORIAData>> getAllAuditorias() => select(lcauditoria).get();
  Stream<List<LCAUDITORIAData>> watchAllAuditorias() => select(lcauditoria).watch();
  Future<List<LCAUDITORIAData?>> getAuditoriaById(int id) {
    return (select(lcauditoria)..where((tbl) => tbl.lcAudId.equals(id)))
        .get();
  }
  Stream<List<LCAUDITORIAData?>> watchAuditoriaById(int id) {
    return (select(lcauditoria)..where((tbl) => tbl.lcAudId.equals(id)))
        .watch();
  }
  Future<int> insertAuditoria(LCAUDITORIACompanion auditoria) => into(lcauditoria).insert(auditoria);
  Future<bool> updateAuditoria(LCAUDITORIACompanion auditoria) => update(lcauditoria).replace(auditoria);
  Future<int> deleteAuditoria(LCAUDITORIACompanion auditoria) => delete(lcauditoria).delete(auditoria);
}

@DriftAccessor(tables: [LCCARRINHO, CDPRODUTO]) 
class LCCARRINHODAO extends DatabaseAccessor<AppDatabase> with _$LCCARRINHODAOMixin {
  final AppDatabase db;

  // O construtor é chamado pelo AppDatabase
  LCCARRINHODAO(this.db) : super(db);
  
  Stream<List<LCCARRINHOData>> watchCarrinhoSimplesDoUsuario(int usuarioId) {
    return (select(lccarrinho)..where((t) => t.lcCarUsuarioId.equals(usuarioId))).watch();
  }
  Future<LCCARRINHOData?> getItemByProdutoEUsuario(int produtoId, int usuarioId) {
    return (select(lccarrinho)
      ..where((t) => t.lcCarProdutoId.equals(produtoId) & t.lcCarUsuarioId.equals(usuarioId))
    ).getSingleOrNull();
  }
  Future<int> insertItem(LCCARRINHOCompanion item) => into(lccarrinho).insert(item);
  Future<bool> updateItem(LCCARRINHOCompanion item) => update(lccarrinho).replace(item);
  Future<int> deleteItem(LCCARRINHOCompanion item) => delete(lccarrinho).delete(item);
  Future<void> limparCarrinhoDoUsuario(int usuarioId) {
    return (delete(lccarrinho)..where((t) => t.lcCarUsuarioId.equals(usuarioId))).go();
  }

  /// Remove todos os itens do carrinho (app cliente atual = um usuário de teste).
  Future<void> limparTodoCarrinho() async {
    await delete(lccarrinho).go();
  }
}

late AppDatabase appDatabase;
