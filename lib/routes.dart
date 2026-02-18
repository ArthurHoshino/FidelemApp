import 'package:fidelem_app/modules/cliente/home/home_view.dart';
import 'package:fidelem_app/modules/auth/login/login_view.dart';
import 'package:fidelem_app/modules/auth/redefinir_senha/redefinir_senha_view.dart';
import 'package:fidelem_app/modules/auth/registro/registro_view.dart';
import 'package:fidelem_app/modules/cliente/carrinho/views/carrinho_view.dart';
import 'package:fidelem_app/modules/cliente/carrinho/views/pagamento_view.dart';
import 'package:fidelem_app/modules/cliente/carrinho/views/pedido_sucesso_view.dart';
import 'package:fidelem_app/modules/mercado/home/home_view.dart';
import 'package:fidelem_app/modules/Config/config_view.dart';
import 'package:fidelem_app/modules/cliente/loja_pontos/loja_pontos_view.dart';
import 'package:fidelem_app/base_view.dart';
import 'package:flutter/widgets.dart';
import 'package:fidelem_app/modules/mercado/inventario/add_edit_view.dart';

class Routes {
  // Rotas de fluxo geral
  static const String splash = '/';
  static const String loginPage = '/login';
  static const String registroPage = '/registro';
  static const String redefinirSenhaPage = '/redefinir-senha';
  static const String configPage = '/config';

  // Rotas de fluxo do Cliente
  static const String basePage = '/base';
  static const String homeClientePage = '/home-cliente';
  static const String lojaNormalPage = '/loja-normal';
  static const String lojaPontosPage = '/loja-pontos';
  static const String carrinhoPage = '/carrinho';
  static const String pagamentoPage = '/pagamento';
  static const String pedidoSuccessoPage = '/pedido-successo';

  // Rotas do fluxo do Mercado
  static const String homeMercadoPage = '/home-mercado';
  static const String inventarioPage = '/inventario';
  static const String adicionarProdutoPage = '/inventario/add-produto';
  static const String editarProdutoPage = '/inventario/edit-produto';
  static const String adicionarProdutoScanPage = '/inventario/add-scan';

  static Map<String, WidgetBuilder> get rotas {
    return {
      // Rotas de fluxo geral
      registroPage: (context) => const RegistroView(),
      loginPage: (context) => const LoginView(),
      redefinirSenhaPage: (context) => const RedefinirSenhaView(),
      configPage: (context) => const SettingsView(),

      // Rotas de fluxo do Cliente
      carrinhoPage: (context) => const CarrinhoView(),
      pagamentoPage: (context) => const PagamentoView(total: 0.0),
      pedidoSuccessoPage: (context) => const PedidoSucessoView(),
      homeClientePage: (context) => const HomeClienteView(),
      lojaPontosPage: (context) => const LojaPontosView(),
      basePage: (context) => const BaseView(),

      // Rotas do fluxo do Mercado
      adicionarProdutoPage: (context) => const AddEditView(isEditing: false),
      editarProdutoPage: (context) => const AddEditView(isEditing: true),
      homeMercadoPage: (context) => const HomeMercadoView(),
    };
  }
}
