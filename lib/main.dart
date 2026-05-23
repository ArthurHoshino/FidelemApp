import 'package:flutter/material.dart';
import 'package:fidelem_app/core/data/teste/database_seed.dart';
import 'package:fidelem_app/database/database.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/core/tema/tema.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appDatabase = AppDatabase();
  await DatabaseSeed.executarSeNecessario(appDatabase);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static Map<String, dynamic>? dadosUsuario;
  static String? empresaId;
  static bool isCliente = false;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fidelem App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Cor.azul,
        ),
      ),
      initialRoute: Routes.loginPage,
      routes: Routes.rotas,
    );
  }
}