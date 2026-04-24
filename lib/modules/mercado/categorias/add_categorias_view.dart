import 'package:fidelem_app/modules/mercado/categorias/add_categorias_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/core/widgets/fid_input_box.dart';
import 'package:fidelem_app/modules/mercado/categorias/add_categorias_viewmodel.dart';
import 'package:provider/provider.dart';

class AddCategoriasView extends StatelessWidget {
  const AddCategoriasView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return ChangeNotifierProvider(
      create: (_) => AddCategoriasViewmodel(categoriaEditada: args),
      child: const _CategoriasAddContent(),
    );
  }
}

class _CategoriasAddContent extends StatelessWidget {
  const _CategoriasAddContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddCategoriasViewmodel>();
    final isEdit = viewModel.categoriaEditada != null;

    return Scaffold(
      backgroundColor: Cor.branco,
      appBar: AppBar(
        title: Text(isEdit ? "Editar categoria" : "Adicionar categoria"),
        centerTitle: true,
        backgroundColor: Cor.branco,
        foregroundColor: Cor.preto,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(isEdit ? "Editar a categoria" : "Dados da Categoria",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 24),

            // Nome da categoria
            FIDInputBox(
              preset: FIDInputBox.medium,
              text: "Nome da categoria",
              controller: viewModel.nomeController,
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
                final success = await viewModel.salvarCategoria(context);
                if (success && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Categoria salva com sucesso!"), backgroundColor: Colors.green),
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
