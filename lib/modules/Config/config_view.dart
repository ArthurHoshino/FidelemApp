import 'package:flutter/material.dart';
import 'package:fidelem_app/routes.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  static const Color azul = Color(0xFF006FFD);
  static const Color cinza = Color(0xFF717375); // cor da imagem
  int currentIndex = 2; // Configuração selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("Configurações"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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
                  backgroundColor: const Color(0xFFDADADA),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(Icons.edit, size: 16, color: Colors.white),
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
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const SizedBox(height: 32),

            // Botão Redefinir Senha
            ListTile(
              leading: const Icon(Icons.lock_reset, color: Colors.black),
              title: const Text("Redefinir Senha"),
              onTap: () {
                Navigator.pushNamed(context, Routes.redefinirSenhaPage);
              },
            ),

            const Divider(),

            // Botão Encerrar Sessão
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Encerrar Sessão",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pushNamed(context, Routes.registroPage);
              },
            ),
          ],
        ),
      ),

      // ✅ Barra de navegação com ícones não selecionados na cor #717375
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedItemColor: azul,
        unselectedItemColor: cinza, // cor da imagem
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          if (index == 0) {
            // ação de adicionar
          } else if (index == 1) {
            Navigator.pushNamed(context, Routes.homePage);
          } else if (index == 2) {
            // já está em Configuração
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Adicionar produto",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Configuração",
          ),
        ],
      ),
    );
  }
}
