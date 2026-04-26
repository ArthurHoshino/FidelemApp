import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/core/widgets/fid_input_box.dart';
import 'package:fidelem_app/core/widgets/fid_select_box.dart';
import 'package:fidelem_app/modules/mercado/funcionarios/funcionarios_add_viewmodel.dart';
import 'package:provider/provider.dart';

class FuncionariosAddView extends StatelessWidget {
  const FuncionariosAddView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return ChangeNotifierProvider(
      create: (_) => FuncionariosAddViewModel(funcionarioEditado: args),
      child: const _FuncionariosAddContent(),
    );
  }
}

class _FuncionariosAddContent extends StatelessWidget {
  const _FuncionariosAddContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FuncionariosAddViewModel>();
    final isEdit = viewModel.funcionarioEditado != null;

    return Scaffold(
      backgroundColor: Cor.branco,
      appBar: AppBar(
        title: Text(isEdit ? "Editar Funcionário" : "Novo Funcionário"),
        centerTitle: true,
        backgroundColor: Cor.branco,
        foregroundColor: Cor.preto,
        elevation: 0,
      ),
      body: viewModel.isLoadingCargos
          ? const Center(child: CircularProgressIndicator(color: Cor.azul))
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os conteúdos para os FID Widgets
                children: [
                   Text(isEdit ? "Editar os dados" : "Dados do Funcionário", 
                       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                   ),
                  const SizedBox(height: 24),
                  
                  // Nome
                  FIDInputBox(
                    preset: FIDInputBox.medium,
                    text: "Nome",
                    controller: viewModel.nomeController,
                    width: 0.9,
                  ),
                  
                  // Email
                  FIDInputBox(
                    preset: FIDInputBox.medium,
                    text: "E-mail",
                    controller: viewModel.emailController,
                    width: 0.9,
                  ),

                  // Senha
                  if (!isEdit)
                    FIDInputBox(
                      preset: FIDInputBox.medium,
                      text: isEdit ? "Nova Senha (opcional)" : "Senha",
                      obscureText: true,
                      controller: viewModel.senhaController,
                      width: 0.9,
                    ),

                  // CPF/CNPJ
                  FIDInputBox(
                    preset: FIDInputBox.medium,
                    text: "CPF/CNPJ (Opcional)",
                    controller: viewModel.cpfCnpjController,
                    width: 0.9,
                  ),

                  // Telefone
                  FIDInputBox(
                    preset: FIDInputBox.medium,
                    text: "Telefone (Opcional)",
                    controller: viewModel.telefoneController,
                    width: 0.9,
                  ),

                  // Cargo Dropdown
                  FIDSelectBox(
                    preset: FIDSelectBox.medium,
                    text: "Cargo",
                    items: viewModel.cargosNomes,
                    controller: viewModel.cargoController,
                    onChanged: (_) {},
                    width: 0.9,
                  ),
                  
                  const SizedBox(height: 24),

                  // Botão Salvar
                  viewModel.isSaving
                      ? const CircularProgressIndicator(color: Cor.azul)
                      : FIDButton(
                          preset: FIDButton.big,
                          text: "SALVAR",
                          onPressed: () async {
                            final success = await viewModel.salvarFuncionario(context);
                            if (success && context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Funcionário salvo com sucesso!"), backgroundColor: Colors.green),
                              );
                              Navigator.pop(context);
                            }
                          },
                        ),
                ],
              ),
            ),
    );
  }
}
