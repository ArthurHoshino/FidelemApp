import 'package:decimal/decimal.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:fidelem_app/database/database.dart';

void main() {
  late AppDatabase database;
  late CDEMPRESADAO empresaDao;
  late FIDELSESSAODAO fidelSessaoDao;
  late CDCARGODAO cdCargoDao;
  late CDSENHADAO cdSenhaDao;
  late LCVENDADAO lcVendaDao;
  late CDPRODUTODAO cdProdutoDao;
  late CDCATEGORIADAO cdCategoriaDao;
  late CDPRODUTOIMAGEMDAO cdProdutoImagemDao;
  late CDEXCECAODAO cdExcecaoDao;
  late CDACAODAO cdAcaoDao;
  late LCAUDITORIADAO lcAuditoriaDao;

  setUp(() {
    database = AppDatabase.test(NativeDatabase.memory());
    empresaDao = database.empresaDao;
    fidelSessaoDao = database.fidelSessaoDao;
    cdCargoDao = database.cdCargoDao;
    cdSenhaDao = database.cdSenhaDao;
    lcVendaDao = database.lcVendaDao;
    cdProdutoDao = database.cdProdutoDao;
    cdCategoriaDao = database.cdCategoriaDao;
    cdProdutoImagemDao = database.cdProdutoImagemDao;
    cdExcecaoDao = database.cdExcecaoDao;
    cdAcaoDao = database.cdAcaoDao;
    lcAuditoriaDao = database.lcAuditoriaDao;
  });

  tearDown(() async {
    await database.close();
  });

  // --- CDEMPRESADAO Tests ---
  test('CDEMPRESADAO operations', () async {
    // Insert
    final empresa = CDEMPRESACompanion.insert(cdEmpNome: 'Empresa Teste');
    final id = await empresaDao.insertEmpresa(empresa);
    expect(id, isPositive);

    // Get All
    final all = await empresaDao.getAllEmpresas();
    expect(all.length, 1);
    expect(all.first.cdEmpNome, 'Empresa Teste');

    // Get By ID
    final fetched = await empresaDao.getEmpresaById(id);
    expect(fetched?.cdEmpNome, 'Empresa Teste');

    // Watch
    final stream = empresaDao.watchAllEmpresas();
    expect(stream, emits(isNotEmpty));

    // Update
    final updatedEmpresa = CDEMPRESACompanion(
      cdEmpId: Value(id),
      cdEmpNome: Value('Empresa Atualizada'),
    );
    await empresaDao.updateEmpresa(updatedEmpresa);
    final afterUpdate = await empresaDao.getEmpresaById(id);
    expect(afterUpdate?.cdEmpNome, 'Empresa Atualizada');

    // Delete
    await empresaDao.deleteEmpresa(updatedEmpresa);
    final afterDelete = await empresaDao.getAllEmpresas();
    expect(afterDelete, isEmpty);
  });

  // --- CDCARGODAO Tests ---
  test('CDCARGODAO operations', () async {
    final empresaId = await empresaDao.insertEmpresa(CDEMPRESACompanion.insert(cdEmpNome: 'Empresa Teste'));

    // Insert
    final cargo = CDCARGOCompanion.insert(cdCarNome: 'Gerente', cdCarEmpresaId: empresaId);
    final id = await cdCargoDao.insertCargo(cargo);
    expect(id, isPositive);

    // Get All
    final all = await cdCargoDao.getAllCargos();
    expect(all.length, 1);

    // Get By ID
    final fetched = await cdCargoDao.getCargosById(id);
    expect(fetched?.cdCarNome, 'Gerente');

    // Watch
    final stream = cdCargoDao.watchAllCargos();
    expect(stream, emits(isNotEmpty));

    // Update
    final updatedCargo = CDCARGOCompanion(
      cdCarid: Value(id),
      cdCarNome: Value('Diretor'),
      cdCarEmpresaId: Value(empresaId),
    );
    await cdCargoDao.updateCargo(updatedCargo);
    final afterUpdate = await cdCargoDao.getCargosById(id);
    expect(afterUpdate?.cdCarNome, 'Diretor');

    // Delete
    await cdCargoDao.deleteCargo(updatedCargo);
    final afterDelete = await cdCargoDao.getAllCargos();
    expect(afterDelete, isEmpty);
  });

  // --- CDSENHADAO Tests ---
  test('CDSENHADAO operations', () async {

    final empresaId = await empresaDao.insertEmpresa(CDEMPRESACompanion.insert(cdEmpNome: 'Empresa Teste'));
    final cargoId = await cdCargoDao.insertCargo(CDCARGOCompanion.insert(cdCarNome: 'Cargo Senha', cdCarEmpresaId: empresaId));

    // Insert
    final senha = CDSENHACompanion.insert(
      cdSeNome: 'Usuario Teste',
      cdSeSenha: '123',
      cdSeEmail: 'test@test.com',
      cdSeCargoId: cargoId,
    );
    final id = await cdSenhaDao.insertSenha(senha);
    expect(id, isPositive);

    // Get All
    final all = await cdSenhaDao.getAllSenhas();
    expect(all.length, 1);

    // Get By ID
    final fetched = await cdSenhaDao.getSenhaById(id);
    expect(fetched?.cdSeNome, 'Usuario Teste');

    // Watch
    final stream = cdSenhaDao.watchAllSenhas();
    expect(stream, emits(isNotEmpty));

    // Update
    final updatedSenha = CDSENHACompanion(
      cdSeId: Value(id),
      cdSeNome: Value('Usuario Atualizado'),
      cdSeSenha: Value('123'),
      cdSeEmail: Value('test@test.com'),
      cdSeCargoId: Value(cargoId),
    );
    await cdSenhaDao.updateSenha(updatedSenha);
    final afterUpdate = await cdSenhaDao.getSenhaById(id);
    expect(afterUpdate?.cdSeNome, 'Usuario Atualizado');

    // Delete
    await cdSenhaDao.deleteSenha(updatedSenha);
    final afterDelete = await cdSenhaDao.getAllSenhas();
    expect(afterDelete, isEmpty);
  });

  // --- FIDELSESSAODAO Tests ---
  test('FIDELSESSAODAO operations', () async {
    
    final empresaId = await empresaDao.insertEmpresa(CDEMPRESACompanion.insert(cdEmpNome: 'Empresa Teste'));
    final cargoId = await cdCargoDao.insertCargo(CDCARGOCompanion.insert(cdCarNome: 'Cargo Sessao', cdCarEmpresaId: empresaId));
    final senhaId = await cdSenhaDao.insertSenha(CDSENHACompanion.insert(cdSeNome: 'User', cdSeSenha: '123', cdSeEmail: 'a@a.com', cdSeCargoId: cargoId));

    // Insert
    final sessao = FIDELSESSAOCompanion.insert(
      fidelSesExpira: 3600,
      fidelSesDtSessao: DateTime.now(),
      fidelSesSenhaId: senhaId,
    );
    final id = await fidelSessaoDao.insertSessao(sessao);
    expect(id, isPositive);

    // Get All
    final all = await fidelSessaoDao.getAllSessoes();
    expect(all.length, 1);

    // Get By ID
    final fetched = await fidelSessaoDao.getSessaoById(id);
    expect(fetched?.fidelSesSenhaId, senhaId);

    // Watch
    final stream = fidelSessaoDao.watchAllSessoes();
    expect(stream, emits(isNotEmpty));

    // Update
    final updatedSessao = FIDELSESSAOCompanion(
      fidelSesId: Value(id),
      fidelSesExpira: Value(7200),
      fidelSesDtSessao: Value(DateTime.now()),
      fidelSesSenhaId: Value(senhaId),
    );
    await fidelSessaoDao.updateSessao(updatedSessao);
    final afterUpdate = await fidelSessaoDao.getSessaoById(id);
    expect(afterUpdate?.fidelSesExpira, 7200);

    // Delete
    await fidelSessaoDao.deleteSessao(updatedSessao);
    final afterDelete = await fidelSessaoDao.getAllSessoes();
    expect(afterDelete, isEmpty);
  });

  // --- LCVENDADAO Tests ---
  test('LCVENDADAO operations', () async {
    
    final empresaId = await empresaDao.insertEmpresa(CDEMPRESACompanion.insert(cdEmpNome: 'Empresa Teste'));
    final cargoId = await cdCargoDao.insertCargo(CDCARGOCompanion.insert(cdCarNome: 'Cargo Venda', cdCarEmpresaId: empresaId));
    final senhaId = await cdSenhaDao.insertSenha(CDSENHACompanion.insert(cdSeNome: 'User', cdSeSenha: '123', cdSeEmail: 'a@a.com', cdSeCargoId: cargoId));

    // Insert
    final venda = LCVENDACompanion.insert(
      lcVenSenhaId: senhaId,
      lcVenProdutos: 'Prod A',
      lcvenData: DateTime.now(),
    );
    final id = await lcVendaDao.insertVenda(venda);
    expect(id, isPositive);

    // Get All
    final all = await lcVendaDao.getAllVendas();
    expect(all.length, 1);

    // Get By ID (Returns List)
    final fetchedList = await lcVendaDao.getVendaById(id);
    expect(fetchedList.length, 1);
    expect(fetchedList.first?.lcVenProdutos, 'Prod A');

    // Watch
    final stream = lcVendaDao.watchAllVendas();
    expect(stream, emits(isNotEmpty));

    // Update
    final updatedVenda = LCVENDACompanion(
      lcVenId: Value(id),
      lcVenSenhaId: Value(senhaId),
      lcVenProdutos: Value('Prod A, Prod B'),
      lcvenData: Value(DateTime.now()),
    );
    await lcVendaDao.updateVenda(updatedVenda);
    final afterUpdateList = await lcVendaDao.getVendaById(id);
    expect(afterUpdateList.first?.lcVenProdutos, 'Prod A, Prod B');

    // Delete
    await lcVendaDao.deleteVenda(updatedVenda);
    final afterDelete = await lcVendaDao.getAllVendas();
    expect(afterDelete, isEmpty);
  });

  // --- CDCATEGORIADAO Tests ---
  test('CDCATEGORIADAO operations', () async {
    // Insert
    final categoria = CDCATEGORIACompanion.insert(cdCatNome: 'Eletronicos');
    final id = await cdCategoriaDao.insertCategoria(categoria);
    expect(id, isPositive);

    // Get All
    final all = await cdCategoriaDao.getAllCategorias();
    expect(all.length, 1);

    // Get By ID
    final fetched = await cdCategoriaDao.getCategoriaById(id);
    expect(fetched?.cdCatNome, 'Eletronicos');

    // Watch
    final stream = cdCategoriaDao.watchAllCategorias();
    expect(stream, emits(isNotEmpty));

    // Update
    final updatedCategoria = CDCATEGORIACompanion(
      cdCatId: Value(id),
      cdCatNome: Value('Eletrodomesticos'),
    );
    await cdCategoriaDao.updateCategoria(updatedCategoria);
    final afterUpdate = await cdCategoriaDao.getCategoriaById(id);
    expect(afterUpdate?.cdCatNome, 'Eletrodomesticos');

    // Delete
    await cdCategoriaDao.deleteCategoria(updatedCategoria);
    final afterDelete = await cdCategoriaDao.getAllCategorias();
    expect(afterDelete, isEmpty);
  });

  // --- CDPRODUTODAO Tests ---
  test('CDPRODUTODAO operations', () async {
    
    final empresaId = await empresaDao.insertEmpresa(CDEMPRESACompanion.insert(cdEmpNome: 'Empresa Teste'));
    final catId = await cdCategoriaDao.insertCategoria(CDCATEGORIACompanion.insert(cdCatNome: 'Cat Prod'));

    // Insert
    final produto = CDPRODUTOCompanion.insert(
      cdProdNome: 'Notebook',
      cdProdDescricao: 'Gaming',
      cdProdPrecoPonto: 1000,
      cdProdPrecoQtdEstoque: 10,
      cdProdEmpresaId: empresaId,
      cdProdCategoriaId: catId,
      cdProdPrecoReal: Value(Decimal.parse('5000.00')),
    );
    final id = await cdProdutoDao.insertProduto(produto);
    expect(id, isPositive);

    // Get All
    final all = await cdProdutoDao.getAllProdutos();
    expect(all.length, 1);

    // Get By ID
    final fetched = await cdProdutoDao.getProdutoById(id);
    expect(fetched?.cdProdNome, 'Notebook');

    // Watch
    final stream = cdProdutoDao.watchAllProdutos();
    expect(stream, emits(isNotEmpty));

    // Update
    final updatedProduto = CDPRODUTOCompanion(
      cdProdId: Value(id),
      cdProdNome: Value('Notebook Pro'),
      cdProdDescricao: Value('Gaming'),
      cdProdPrecoPonto: Value(1000),
      cdProdPrecoQtdEstoque: Value(10),
      cdProdEmpresaId: Value(empresaId),
      cdProdCategoriaId: Value(catId),
      cdProdPrecoReal: Value(Decimal.parse('5000.00')),
    );
    await cdProdutoDao.updateProduto(updatedProduto);
    final afterUpdate = await cdProdutoDao.getProdutoById(id);
    expect(afterUpdate?.cdProdNome, 'Notebook Pro');

    // Delete
    await cdProdutoDao.deleteProduto(updatedProduto);
    final afterDelete = await cdProdutoDao.getAllProdutos();
    expect(afterDelete, isEmpty);
  });

  // --- CDPRODUTOIMAGEMDAO Tests ---
  test('CDPRODUTOIMAGEMDAO operations', () async {
    
    final empresaId = await empresaDao.insertEmpresa(CDEMPRESACompanion.insert(cdEmpNome: 'Empresa Teste'));
    final catId = await cdCategoriaDao.insertCategoria(CDCATEGORIACompanion.insert(cdCatNome: 'Cat Img'));
    final prodId = await cdProdutoDao.insertProduto(CDPRODUTOCompanion.insert(
      cdProdNome: 'Prod Img',
      cdProdDescricao: 'Desc',
      cdProdPrecoPonto: 100,
      cdProdPrecoQtdEstoque: 5,
      cdProdEmpresaId: empresaId,
      cdProdCategoriaId: catId,
    ));

    // Insert
    final imagem = CDPRODUTOIMAGEMCompanion.insert(
      cdProdImgBlob: Uint8List.fromList([1, 2, 3]),
      cdProdImgProdutoId: prodId,
    );
    final id = await cdProdutoImagemDao.insertImagem(imagem);
    expect(id, isPositive);

    // Get All
    final all = await cdProdutoImagemDao.getAllImagens();
    expect(all.length, 1);

    // Get By ID (Returns List)
    final fetchedList = await cdProdutoImagemDao.getImagemById(id);
    expect(fetchedList.length, 1);

    // Watch
    final stream = cdProdutoImagemDao.watchAllImagens();
    expect(stream, emits(isNotEmpty));

    // Update
    final updatedImagem = CDPRODUTOIMAGEMCompanion(
      cdProdImgId: Value(id),
      cdProdImgBlob: Value(Uint8List.fromList([4, 5, 6])),
      cdProdImgProdutoId: Value(prodId),
    );
    await cdProdutoImagemDao.updateImagem(updatedImagem);
    final afterUpdateList = await cdProdutoImagemDao.getImagemById(id);
    expect(afterUpdateList.first?.cdProdImgBlob, Uint8List.fromList([4, 5, 6]));

    // Delete
    await cdProdutoImagemDao.deleteImagem(updatedImagem);
    final afterDelete = await cdProdutoImagemDao.getAllImagens();
    expect(afterDelete, isEmpty);
  });

  // --- CDEXCECAODAO Tests ---
  test('CDEXCECAODAO operations', () async {
    
    final empresaId = await empresaDao.insertEmpresa(CDEMPRESACompanion.insert(cdEmpNome: 'Empresa Teste'));

    // Insert
    final excecao = CDEXCECAOCompanion.insert(
      cdExDescricao: 'Erro Teste',
      cdExData: DateTime.now(),
      cdExEmpresaId: empresaId,
    );
    final id = await cdExcecaoDao.insertExcecao(excecao);
    expect(id, isPositive);

    // Get All
    final all = await cdExcecaoDao.getAllExcecoes();
    expect(all.length, 1);

    // Get By ID (Returns List)
    final fetchedList = await cdExcecaoDao.getExcecaoById(id);
    expect(fetchedList.length, 1);
    expect(fetchedList.first?.cdExDescricao, 'Erro Teste');

    // Watch
    final stream = cdExcecaoDao.watchAllExcecoes();
    expect(stream, emits(isNotEmpty));

    // Update
    final updatedExcecao = CDEXCECAOCompanion(
      cdExId: Value(id),
      cdExDescricao: Value('Erro Corrigido'),
      cdExData: Value(DateTime.now()),
      cdExEmpresaId: Value(empresaId),
    );
    await cdExcecaoDao.updateExcecao(updatedExcecao);
    final afterUpdateList = await cdExcecaoDao.getExcecaoById(id);
    expect(afterUpdateList.first?.cdExDescricao, 'Erro Corrigido');

    // Delete
    await cdExcecaoDao.deleteExcecao(updatedExcecao);
    final afterDelete = await cdExcecaoDao.getAllExcecoes();
    expect(afterDelete, isEmpty);
  });

  // --- CDACAODAO Tests ---
  test('CDACAODAO operations', () async {
    // Insert
    final acao = CDACAOCompanion.insert(cdAcaoDescricao: 'Login');
    final id = await cdAcaoDao.insertAcao(acao);
    expect(id, isPositive);

    // Get All
    final all = await cdAcaoDao.getAllAcoes();
    expect(all.length, 1);

    // Get By ID (Returns List)
    final fetchedList = await cdAcaoDao.getAcaoById(id);
    expect(fetchedList.length, 1);
    expect(fetchedList.first?.cdAcaoDescricao, 'Login');

    // Watch
    final stream = cdAcaoDao.watchAllAcoes();
    expect(stream, emits(isNotEmpty));

    // Update
    final updatedAcao = CDACAOCompanion(
      cdAcaoId: Value(id),
      cdAcaoDescricao: Value('Logout'),
    );
    await cdAcaoDao.updateAcao(updatedAcao);
    final afterUpdateList = await cdAcaoDao.getAcaoById(id);
    expect(afterUpdateList.first?.cdAcaoDescricao, 'Logout');

    // Delete
    await cdAcaoDao.deleteAcao(updatedAcao);
    final afterDelete = await cdAcaoDao.getAllAcoes();
    expect(afterDelete, isEmpty);
  });

  // --- LCAUDITORIADAO Tests ---
  test('LCAUDITORIADAO operations', () async {
    
    final empresaId = await empresaDao.insertEmpresa(CDEMPRESACompanion.insert(cdEmpNome: 'Empresa Teste'));
    final acaoId = await cdAcaoDao.insertAcao(CDACAOCompanion.insert(cdAcaoDescricao: 'Acao Audit'));

    // Insert
    final auditoria = LCAUDITORIACompanion.insert(
      lcAudDescricao: 'Audit Log',
      lcAudData: DateTime.now(),
      lcAudAcaoId: acaoId,
      lcAudEmpresaId: empresaId,
    );
    final id = await lcAuditoriaDao.insertAuditoria(auditoria);
    expect(id, isPositive);

    // Get All
    final all = await lcAuditoriaDao.getAllAuditorias();
    expect(all.length, 1);

    // Get By ID (Returns List)
    final fetchedList = await lcAuditoriaDao.getAuditoriaById(id);
    expect(fetchedList.length, 1);
    expect(fetchedList.first?.lcAudDescricao, 'Audit Log');

    // Watch
    final stream = lcAuditoriaDao.watchAllAuditorias();
    expect(stream, emits(isNotEmpty));

    // Update
    final updatedAuditoria = LCAUDITORIACompanion(
      lcAudId: Value(id),
      lcAudDescricao: Value('Audit Log Updated'),
      lcAudData: Value(DateTime.now()),
      lcAudAcaoId: Value(acaoId),
      lcAudEmpresaId: Value(empresaId),
    );
    await lcAuditoriaDao.updateAuditoria(updatedAuditoria);
    final afterUpdateList = await lcAuditoriaDao.getAuditoriaById(id);
    expect(afterUpdateList.first?.lcAudDescricao, 'Audit Log Updated');

    // Delete
    await lcAuditoriaDao.deleteAuditoria(updatedAuditoria);
    final afterDelete = await lcAuditoriaDao.getAllAuditorias();
    expect(afterDelete, isEmpty);
  });
}