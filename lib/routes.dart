import 'package:fidelem_app/modules/inventario/edit_produto/edit_view.dart';
import 'package:fidelem_app/modules/login/login_view.dart';
import 'package:fidelem_app/modules/redefinir_senha/redefinir_senha_view.dart';
import 'package:fidelem_app/modules/registro/registro_view.dart';
import 'package:fidelem_app/modules/carrinho/carrinho_view.dart';
import 'package:fidelem_app/modules/carrinho/pages/payment_selection_view.dart';
import 'package:fidelem_app/modules/carrinho/pages/checkout_success_view.dart';
import 'package:flutter/widgets.dart';
import 'package:fidelem_app/modules/inventario/add_manual/add_manual_view.dart';
import 'package:path/path.dart';

class Routes {
  // Rotas de fluxo geral
  static const String splash = '/';
  static const String loginPage = '/login';
  static const String registroPage = '/registro';
  static const String redefinirSenhaPage = '/redefinir-senha';
  static const String configPage = '/config';

  // Rotas de fluxo do Cliente
  static const String homePage = '/home';
  static const String lojaNormalPage = '/loja-normal';
  static const String lojaPontosPage = '/loja-pontos';
  static const String carrinhoPage = '/carrinho';
  static const String paymentSelectionPage = '/payment-selection';
  static const String checkoutSuccessPage = '/checkout-success';

  // Rotas do fluxo do Mercado
  static const String inventarioPage = '/inventario';
  static const String adicionarProdutoManualPage = '/inventario/add-manual';
  static const String editarProduto = '/inventario/edit-produto';
  static const String adicionarProdutoScanPage = '/inventario/add-scan';

  static Map<String, WidgetBuilder> get rotas {
    return {
      // Rotas de fluxo geral
      registroPage: (context) => const RegistroView(),
      loginPage: (context) => const LoginView(),
      redefinirSenhaPage: (context) => const RedefinirSenhaView(),

      // Rotas de fluxo do Cliente
      carrinhoPage: (context) => const CarrinhoView(),
      paymentSelectionPage: (context) => const PaymentSelectionView(),
      checkoutSuccessPage: (context) => const CheckoutSuccessView(),

      // Rotas do fluxo do Mercado
      adicionarProdutoManualPage: (context) => const AddManualView(),
      editarProduto: (context) => EditView(),


      //
      homePage: (context) => const RegistroView(), // TODO: Criar HomeView adequada
    };
  }
}