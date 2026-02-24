import 'package:fidelem_app/modules/mercado/home/home_view.dart';
import 'package:fidelem_app/modules/cliente/carrinho/views/carrinho_view.dart';
import 'package:fidelem_app/modules/cliente/carrinho/views/pagamento_view.dart';
import 'package:fidelem_app/modules/cliente/carrinho/views/pedido_sucesso_view.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_bottom_nav.dart';
import 'package:fidelem_app/routes.dart';

class NavConfig {
  final List<String> routes;
  final List<IconData> icons;

  NavConfig({required this.routes, required this.icons});

  // Configuração para Mercado
  static NavConfig mercado = NavConfig(
    routes: [
      Routes.homeMercadoPage,
      Routes.adicionarProdutoPage,
      Routes.editarProdutoPage,
      Routes.configPage,
    ],
    icons: [Icons.home, Icons.add_box, Icons.edit, Icons.settings],
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

  @override
  void initState() {
    super.initState();
    
    // M = mercado else cliente
    final usuario = 'Ma';

    if (usuario == 'M') {
      currentConfig = NavConfig.mercado;
    } else {
      currentConfig = NavConfig.cliente;
    }
  }

  void onPageChange(int index, {double? total}) {
    setState(() {
      currentIndex = index;
      if (total != null) {
        valorTotalVenda = total; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        setState(() {
          currentIndex = 0;
        });
      },
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: currentConfig.routes.map((routeName) {
            final builder = Routes.rotas[routeName];
            if (routeName == Routes.homeMercadoPage) {
              return HomeMercadoView(onPressed: onPageChange); 
            }
            if (routeName == Routes.carrinhoPage) {
              return CarrinhoView(onPressed: onPageChange);
            }
            if (routeName == Routes.pagamentoPage) {
              return PagamentoView(
                onPressed: onPageChange, 
                total:valorTotalVenda,
              ); 
            }
            if (routeName == Routes.pedidoSuccessoPage) {
              return PedidoSucessoView(onPressed: onPageChange); 
            }
            if (builder != null) {
              return builder(context);
            }
            return Center(child: Text("Rota não encontrada: $routeName"));
          }).toList()
        ),
        bottomNavigationBar: SafeArea(
          child: FIDBottomNavBar(
            currentIndex: currentIndex,
            onTap: onPageChange,
            icons: currentConfig.icons,
          ),
        ),
      )
    );
  }
}