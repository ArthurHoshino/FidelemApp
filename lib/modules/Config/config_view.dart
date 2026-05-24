import 'package:fidelem_app/core/data/enums/cdsenha_enum.dart';
import 'package:fidelem_app/core/data/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/main.dart';

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
            Text(
              MyApp.dadosUsuario?.getPropriedade(EnumGenerico.modelDescricao.descricao) ?? 'Usuário',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // Nome do mercado
            Text(
              MyApp.dadosUsuario?.getPropriedade(CDSenhaEnum.usuarioEntityEmpresa.value) ?? "Mercado",
              style: const TextStyle(fontSize: 16, color: Cor.preto),
            ),

            const SizedBox(height: 32),

            // Opção Gerenciar Funcionários e Gerenciar Cargos (Apenas para funcionários do mercado)
            if (MyApp.isCliente == false || (MyApp.dadosUsuario != null && MyApp.dadosUsuario!.isCliente)) ...[
              ListTile(
                leading: const Icon(Icons.group, color: Cor.preto),
                title: const Text("Gerenciar Funcionários"),
                onTap: () {
                  Navigator.pushNamed(context, Routes.funcionariosPage);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.badge, color: Cor.preto),
                title: const Text("Gerenciar Cargos"),
                onTap: () {
                  Navigator.pushNamed(context, Routes.cargosPage);
                },
              ),
              const Divider(),
            ],

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
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.loginPage,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
