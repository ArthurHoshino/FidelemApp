import 'package:fidelem_app/modules/login/login_view.dart';
import 'package:fidelem_app/modules/redefinir_senha/redefinir_senha_view.dart';
import 'package:fidelem_app/modules/registro/registro_view.dart';
import 'package:flutter/widgets.dart';

class Routes {
  // Rotas de fluxo geral
  static const String splash = '/';
  static const String loginPage = '/login';
  static const String registroPage = '/registro';
  static const String redefinirSenhaPage = '/loja-normal';
  static const String configPage = '/config';

  // Rotas de fluxo do Cliente
  static const String homePage = '/home';
  static const String lojaNormalPage = '/loja-normal';
  static const String lojaPontosPage = '/loja-pontos';

  // Rotas do fluxo do Mercado
  static const String inventarioPage = '/inventario';
  static const String adicionarProdutoManualPage = '/inventario/add-manual';
  static const String adicionarProdutoScanPage = '/inventario/add-scan';

  static String? checkoutSuccessPage;

  static Map<String, WidgetBuilder> get rotas {
    return {
      registroPage: (context) => const RegistroView(),
      loginPage: (context) => const LoginView(),
      redefinirSenhaPage: (context) => const RedefinirSenhaView(),
    };
  }

  static String? get paymentSelectionPage => null;
}