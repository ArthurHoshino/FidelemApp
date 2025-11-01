import 'package:fidelem_app/modules/carrinho/carrinho_view.dart';
import 'package:fidelem_app/modules/carrinho/pages/payment_selection_view.dart';
import 'package:fidelem_app/modules/carrinho/pages/checkout_success_view.dart';
import 'package:fidelem_app/modules/config/config_view.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/modules/login/login_view.dart';
import 'package:fidelem_app/modules/registro/registro_view.dart';
import 'package:fidelem_app/modules/redefinir_senha/redefinir_senha_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fidelem App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 37, 150, 190)),
      ),
      initialRoute: Routes.registroPage,
      routes: {
        Routes.registroPage: (context) => const RegistroView(),
        Routes.loginPage: (context) => const LoginView(),
        Routes.redefinirSenhaPage: (context) => const RedefinirSenhaView(),
        Routes.configPage: (context) => const ConfigView(),
        Routes.cartPage: (context) => const CarrinhoView(),
        Routes.paymentSelectionPage: (context) => const PaymentSelectionView(),
        Routes.checkoutSuccessPage: (context) => const CheckoutSuccessView(),
      }
    );
  }
}
