import 'package:flutter/material.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  int currentIndex = 2; // Configuração selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cor.branco,

      appBar: AppBar(
        title: const Text("Configurações"),
        centerTitle: true,
        backgroundColor: Cor.branco,
        foregroundColor: Cor.preto,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Ícone de perfil com botão de edição
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Cor.cinzaClaro,
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Cor.branco,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Cor.azul,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(Icons.edit, size: 16, color: Cor.branco),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Nome do usuário
            const Text(
              "João Silva",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // Nome do mercado
            const Text(
              "Mercado Exemplo",
              style: TextStyle(fontSize: 16, color: Cor.preto),
            ),

            const SizedBox(height: 32),

            // Botão Redefinir Senha
            ListTile(
              leading: const Icon(Icons.lock_reset, color: Cor.preto),
              title: const Text("Redefinir Senha"),
              onTap: () {
                Navigator.pushNamed(context, Routes.redefinirSenhaPage);
              },
            ),

            const Divider(),

            // Botão Encerrar Sessão
            ListTile(
              leading: const Icon(Icons.logout, color: Cor.vermelho),
              title: const Text(
                "Encerrar Sessão",
                style: TextStyle(color: Cor.vermelho),
              ),
              onTap: () {
                Navigator.pushNamed(context, Routes.registroPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
