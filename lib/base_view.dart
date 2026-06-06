import 'dart:io';
import 'package:fidelem_app/modules/mercado/home/home_view.dart';
import 'package:fidelem_app/modules/cliente/carrinho/views/carrinho_view.dart';
import 'package:fidelem_app/modules/cliente/carrinho/views/pagamento_view.dart';
import 'package:fidelem_app/modules/cliente/carrinho/views/pedido_sucesso_view.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_bottom_nav.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/main.dart';
import 'package:fidelem_app/core/data/enums/privilegios_keys.dart';
import 'modules/mercado/inventario/add_edit_view.dart';
import 'package:fidelem_app/core/services/cart_manager.dart';

class NavConfig {
  final List<String> routes;
  final List<IconData> icons;

  NavConfig({required this.routes, required this.icons});

  // Configuração para Mercado
  static NavConfig mercado = NavConfig(
    routes: [
      Routes.homeMercadoPage,
      Routes.adicionarProdutoPage,
      Routes.dashboardPage,
      // Routes.editarProdutoPage,
      Routes.configPage,
    ],
    icons: [Icons.home, Icons.add_box, Icons.auto_graph, Icons.settings],
  );

  // Configuração para Cliente
  static NavConfig cliente = NavConfig(
    routes: [
      Routes.homeClientePage,
      Routes.lojaPontosPage,
      Routes.carrinhoPage,
      Routes.configPage,
      Routes.pagamentoPage,
      Routes.pedidoSuccessoPage,
    ],
    icons: [Icons.home, Icons.shopping_bag, Icons.shopping_cart, Icons.person],
  );
}

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int currentIndex = 0;
  double valorTotalVenda = 0.0;
  late NavConfig currentConfig;
  final GlobalKey<HomeMercadoViewState> homeKey = GlobalKey<HomeMercadoViewState>();

  @override
  void initState() {
    super.initState();

    if (MyApp.isCliente) {
      currentConfig = NavConfig.cliente;
    } else {
      currentConfig = NavConfig.mercado;
    }
  }

  void onPageChange(int index, {double? total}) {
    if (index == 2) {
      CartManager.instance.fetchCart();
    }
    if (!MyApp.isCliente) {
      if (index == 1 && !MyApp.privilegios.contains(PrivilegiosKeys.produtoAdicionar)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Acesso Negado: Privilégio de Adicionar Produtos necessário."), backgroundColor: Colors.red),
        );
        return;
      }
      if (index == 2 && !MyApp.privilegios.contains(PrivilegiosKeys.estatisticasVisualizar)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Acesso Negado: Privilégio de Visualizar Estatísticas necessário."), backgroundColor: Colors.red),
        );
        return;
      }
    }

    if (index == 5) {
      CartManager.instance.clearCart();
    }
    setState(() {
      currentIndex = index;
      if (total != null) {
        valorTotalVenda = total;
      }
    });
  }

  // Exibe um diálogo de confirmação para sair do aplicativo
  Future<bool> _confirmarSaida() async {
    final resultado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sair do aplicativo'),
        content: const Text('Deseja realmente sair do aplicativo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Sim'),
          ),
        ],
      ),
    );
    return resultado ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        if (currentIndex != 0) {
          setState(() {
            currentIndex = 0;
          });
        } else {
          final sair = await _confirmarSaida();
          if (sair) {
            exit(0);
          }
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: currentConfig.routes.map((routeName) {
            final builder = Routes.rotas[routeName];
            if (routeName == Routes.carrinhoPage) {
              return CarrinhoView(onPressed: onPageChange);
            }
            if (routeName == Routes.pagamentoPage) {
              return PagamentoView(
                onPressed: onPageChange,
                total: valorTotalVenda,
              );
            }
            if (routeName == Routes.pedidoSuccessoPage) {
              return PedidoSucessoView(onPressed: onPageChange);
            }
            // HOME MERCADO COM KEY
            if (routeName == Routes.homeMercadoPage) {
              return HomeMercadoView(
                key: homeKey,
                onPressed: onPageChange,
              );
            }
            // ADD EDIT INTERCEPTADO
            if (routeName == Routes.adicionarProdutoPage) {
              return AddEditView(
                isEditing: false,
                onChanged: () async {
                  await homeKey.currentState?.recarregar();
                },
              );
            }
            if (builder != null) {
              return builder(context);
            }

            return Center(child: Text("Rota não encontrada: $routeName"));
          }).toList(),
        ),
        bottomNavigationBar: SafeArea(
          child: FIDBottomNavBar(
            currentIndex: currentIndex,
            onTap: onPageChange,
            icons: currentConfig.icons,
          ),
        ),
      ),
    );
  }
}