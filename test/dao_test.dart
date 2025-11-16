import 'package:decimal/decimal.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:fidelem_app/database/database.dart';

void main() {
  
  // Declara as variáveis que vamos usar em todos os testes
  late AppDatabase database;
  late CDEMPRESADAO empresaDao;
  late FIDELSESSAODAO fidelSessaoDao;
  late CDCATEGORIADAO cdCategoriaDao;
  late CDSENHADAO cdSenhaDao;
  late LCVENDADAO lcVendaDao;
  late CDPRODUTODAO cdProdutoDao;

  // 'setUp' roda ANTES de cada teste
  setUp(() {
    // 1. Cria um banco de dados limpo e em memória
    database = AppDatabase.test(NativeDatabase.memory());
    
    // 2. Pega os DAOs desse banco de dados
    empresaDao = database.empresaDao;
    fidelSessaoDao = database.fidelSessaoDao;
    cdCategoriaDao = database.cdCategoriaDao;
    cdSenhaDao = database.cdSenhaDao;
    lcVendaDao = database.lcVendaDao;
    cdProdutoDao = database.cdProdutoDao;
  });

  // 'tearDown' roda DEPOIS de cada teste
  tearDown(() async {
    // 3. Fecha o banco para limpar tudo
    await database.close();
  });

  test('CDEMPRESADAO pode inserir e ler empresas', () async {
    // ARRANGE (Arrumar)
    final novaEmpresa = CDEMPRESACompanion.insert(cdEmpNome: 'Minha Empresa Teste');
    
    // ACT (Agir)
    await empresaDao.insertEmpresa(novaEmpresa);

    // ASSERT (Verificar)
    final todasEmpresas = await empresaDao.getAllEmpresas();
    
    // Verifica se a lista tem 1 item
    expect(todasEmpresas.length, 1);
    // Verifica se o nome do item é o que esperamos
    expect(todasEmpresas.first.cdEmpNome, 'Minha Empresa Teste');
  });

  test('FIDELSESSAODAO pode buscar uma sessão por ID', () async {
    // ARRANGE
    // (Vamos assumir que você tem um método 'insertSessao' no DAO)
    await fidelSessaoDao.insertSessao(
      FIDELSESSAOCompanion.insert(
        fidelSesExpira: 12345,
        fidelSesDtSessao: DateTime.now(),
        fidelSesSenhaId: 99,
      ),
    );

    // ACT
    // (Assumindo que você criou o método 'getSessaoById' da resposta anterior)
    final sessaoEncontrada = await fidelSessaoDao.getSessaoById(1); // O primeiro ID é 1
    
    // ASSERT
    expect(sessaoEncontrada!.fidelSesSenhaId, 99); // Verifica o valor
  });

  test('CDCATEGORIADAO pode inserir e ler categorias', () async {
    // ARRANGE
    final novaCategoria = CDCATEGORIACompanion.insert(cdCatNome: 'Categoria Teste');

    // ACT
    await cdCategoriaDao.insertCategoria(novaCategoria);

    // ASSERT
    final todasCategorias = await cdCategoriaDao.getAllCategorias();
    
    expect(todasCategorias.length, 1);
    expect(todasCategorias.first.cdCatNome, 'Categoria Teste');
  });

  test('CDSENHADAO pode inserir e ler senhas', () async {
    // ARRANGE
    final novaSenha = CDSENHACompanion.insert(
      cdSeNome: 'Senha Teste',
      cdSeSenha: "123456",
      cdSeEmail: "teste@gmail.com",
      cdSeCargoId: 1,
    );

    // ACT
    await cdSenhaDao.insertSenha(novaSenha);

    // ASSERT
    final todasSenhas = await cdSenhaDao.getAllSenhas();
    
    expect(todasSenhas.length, 1);
    expect(todasSenhas.first.cdSeNome, 'Senha Teste');
  });

  test('LCVENDADAO pode inserir e ler vendas', () async {
    // ARRANGE
    final novaVenda = LCVENDACompanion.insert(
      lcvenData: DateTime.now(),
      lcVenSenhaId: 1,
      lcVenProdutos: "Produto A, Produto B",
    );

    // ACT
    await lcVendaDao.insertVenda(novaVenda);

    // ASSERT
    final todasVendas = await lcVendaDao.getAllVendas();
    
    expect(todasVendas.length, 1);
    expect(todasVendas.first.lcVenSenhaId, 1);
  });

  test('CDPRODUTODAO pode inserir e ler produtos', () async {
    // ARRANGE
    final novoProduto = CDPRODUTOCompanion.insert(
      cdProdNome: 'Produto Teste',
      cdProdDescricao: 'Descrição do Produto Teste',
      cdProdPrecoReal: Value(Decimal.parse('19.99')),
      cdProdPrecoPonto: 200,
      cdProdPrecoDesconto: Value(Decimal.parse('15.99')),
      cdProdPrecoQtdEstoque: 20,
      cdProdCategoriaId: 1,
      cdProdEmpresaId: 1,
    );

    // ACT
    await cdProdutoDao.insertProduto(novoProduto);

    // ASSERT
    final todosProdutos = await cdProdutoDao.getAllProdutos();
    
    expect(todosProdutos.length, 1);
    expect(todosProdutos.first.cdProdNome, 'Produto Teste');
    expect(todosProdutos.first.cdProdPrecoReal, Decimal.parse('19.99'));
  });
}