import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'dart:async'; 
import 'package:fidelem_app/database/database.dart'; 
import 'package:fidelem_app/core/widgets/fid_header.dart'; 
import 'package:fidelem_app/core/data/test/loja_test_data.dart';
import 'package:fidelem_app/modules/loja_pontos/components/loja_banner.dart';
import 'package:fidelem_app/modules/loja_pontos/components/loja_filters.dart';
import 'package:fidelem_app/modules/loja_pontos/components/loja_product_grid.dart';
import 'package:fidelem_app/modules/loja_pontos/components/loja_produto_card.dart'; 
import 'package:decimal/decimal.dart'; 

class LojaPontosView extends StatefulWidget {
  const LojaPontosView({super.key});

  @override
  State<LojaPontosView> createState() => _LojaPontosViewState();
}

class _LojaPontosViewState extends State<LojaPontosView> {
  String _selectedSort = 'Mais Vendidos';
  
  List<Produto> _products = []; 
  
  final userId = 1;
  StreamSubscription<List<LCCARRINHOData>>? _cartSubscription; 

  @override
  void initState() {
    super.initState();
    _ensureProductsInDatabase(); 
    _loadProductsAndCartState(); 
  }

  @override
  void dispose() {
    _cartSubscription?.cancel();
    super.dispose();
  }

  void _ensureProductsInDatabase() async {
    final testProducts = LojaTestData.produtos;
    for (var item in testProducts) {
      final prodId = int.tryParse(item['id'].toString()) ?? -1;
      
      if (prodId != -1) {
        final existingProduct = await appDatabase.cdProdutoDao.getProdutoById(prodId);

        if (existingProduct == null) {
          final novoProduto = CDPRODUTOCompanion(
            cdProdId: drift.Value(prodId),
            cdProdNome: drift.Value(item['nome'].toString()),
            cdProdDescricao: drift.Value('Descrição do Produto ${item['id']}'),
            cdProdPrecoReal: drift.Value(Decimal.parse((item['preco'] as num).toString())),
            cdProdPrecoPonto: drift.Value(item['pontos'] as int),
            cdProdPrecoDesconto: drift.Value(Decimal.zero),
            cdProdPrecoQtdEstoque: const drift.Value(99),
            cdProdEmpresaId: const drift.Value(1),
            cdProdCategoriaId: const drift.Value(1),
          );
          await appDatabase.cdProdutoDao.insertProduto(novoProduto);
        }
      }
    }
  }

  void _loadProductsAndCartState() {
    final testProducts = LojaTestData.produtos.map((item) {
      return Produto(
        id: item['id']?.toString() ?? '0', 
        nome: item['nome'].toString(), 
        preco: (item['preco'] as num?)?.toDouble() ?? 0.0,
        pontos: item['pontos'] as int? ?? 0, 
        imagem: item['imagem'].toString(),
        quantidadeNoCarrinho: 0, 
      );
    }).toList();

    _cartSubscription = appDatabase.carrinhoDao.watchCarrinhoSimplesDoUsuario(userId).listen((cartItems) {
      if (!mounted) return;
      
      final Map<int, int> newCartState = {};
      for (var item in cartItems) {
        newCartState[item.lcCarProdutoId] = item.lcCarQuantidade;
      }
      
      final updatedProducts = testProducts.map((p) {
        final prodIdInt = int.tryParse(p.id) ?? -1;
        final quantity = newCartState[prodIdInt] ?? 0;

        return Produto(
          id: p.id,
          nome: p.nome,
          preco: p.preco,
          pontos: p.pontos,
          imagem: p.imagem,
          quantidadeNoCarrinho: quantity, 
        );
      }).toList();

      setState(() {
        _products = updatedProducts;
      });
    });
  }

  Future<void> _updateCart(String productId, int change) async {
    final prodId = int.tryParse(productId) ?? -1;
    if (prodId == -1) return; 

    final itemExistente = await appDatabase.carrinhoDao.getItemByProdutoEUsuario(prodId, userId);

    if (itemExistente != null) {
      int novaQtd = (itemExistente.lcCarQuantidade + change);
      
      if (novaQtd < 1) { 
        await appDatabase.carrinhoDao.deleteItem(itemExistente.toCompanion(true));
        if(mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item removido!")));

      } else {
        await appDatabase.carrinhoDao.updateItem(itemExistente.toCompanion(true).copyWith(
          lcCarQuantidade: drift.Value(novaQtd),
        ));
        if(mounted && change == 1) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Quantidade atualizada!")));
      }

    } else if (change == 1) {
      final novoItem = LCCARRINHOCompanion(
        lcCarProdutoId: drift.Value(prodId),
        lcCarUsuarioId: drift.Value(userId),
        lcCarQuantidade: const drift.Value(1),
      );
      
      await appDatabase.carrinhoDao.insertItem(novoItem);
      
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item adicionado!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> banners = LojaTestData.banners;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const FIDHeader(), 
              const SizedBox(height: 10),
              
              LojaBanner(bannerItems: banners),
              const SizedBox(height: 12),
              LojaFilters(
                currentSort: _selectedSort,
                onSortChanged: (val) => setState(() => _selectedSort = val),
                onFilterPressed: () {},
              ),
              const SizedBox(height: 12),
              
              LojaProductGrid(
                products: _products,
                onUpdateCart: _updateCart,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}