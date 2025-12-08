import 'package:flutter/material.dart';
import 'package:fidelem_app/routes.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  // Static permite acessar sem dar "new Sessao()"
  static Map<String, dynamic>? dadosUsuario;
  static String? empresaId;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fidelem App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 37, 150, 190)),
      ),
      initialRoute: Routes.loginPage,
      routes: Routes.rotas
    );
  }
}
