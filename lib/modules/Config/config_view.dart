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

            ListenableBuilder(
              listenable: MyApp.dadosUsuarioNotifier,
              builder: (context, child) {
                final user = MyApp.dadosUsuario;
                return Column(
                  children: [
                    // Nome do usuário
                    Text(
                      user?.getPropriedade(EnumGenerico.modelDescricao.descricao) ?? 'Usuário',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    // Nome do mercado
                    Text(
                      user?.getPropriedade(CDSenhaEnum.usuarioEntityEmpresa.value) ?? "Mercado",
                      style: const TextStyle(fontSize: 16, color: Cor.preto),
                    ),

                    if (user != null && user.isCliente) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Cor.azul.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Cor.azul.withOpacity(0.2)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.stars_rounded,
                              color: Colors.amber,
                              size: 22,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "${user.pontos} pontos acumulados",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Cor.preto,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),

            const SizedBox(height: 24),

            // Opção Gerenciar Funcionários e Gerenciar Cargos (Apenas para funcionários do mercado)
            if (MyApp.isCliente == false) ...[
              if (MyApp.privilegios.contains(PrivilegiosKeys.funcionarioGerenciar)) ...[
                ListTile(
                  leading: const Icon(Icons.group, color: Cor.preto),
                  title: const Text("Gerenciar Funcionários"),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.funcionariosPage);
                  },
                ),
                const Divider(),
              ],
              if (MyApp.privilegios.contains(PrivilegiosKeys.cargoGerenciar)) ...[
                ListTile(
                  leading: const Icon(Icons.badge, color: Cor.preto),
                  title: const Text("Gerenciar Cargos"),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.cargosPage);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet, color: Cor.preto),
                  title: const Text("Gerenciar Categorias"),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.categoriasPage);
                  },
                ),
                const Divider(),
              ],
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
