import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/modules/mercado/categorias/categorias_viewmodel.dart';
import 'package:provider/provider.dart';

class CategoriasView extends StatelessWidget {
  const CategoriasView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoriasViewmodel(),
      child: const _CategoriasContent(),
    );
  }
}

class _CategoriasContent extends StatelessWidget {
  const _CategoriasContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CategoriasViewmodel>();

    return Scaffold(
      backgroundColor: Cor.branco,
      appBar: AppBar(
        title: const Text("Gerenciar categorias"),
        centerTitle: true,
        backgroundColor: Cor.branco,
        foregroundColor: Cor.preto,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Cor.azul,
        onPressed: () async {
          await Navigator.pushNamed(context, Routes.addCategoriaPage);
          if (context.mounted) {
            context.read<CategoriasViewmodel>().carregarCategorias();
          }
        },
        child: const Icon(Icons.add, color: Cor.branco),
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator(color: Cor.azul))
          : viewModel.errorMessage != null
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(viewModel.errorMessage!, style: const TextStyle(color: Cor.vermelho)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: viewModel.carregarCategorias,
              style: ElevatedButton.styleFrom(backgroundColor: Cor.azul),
              child: const Text("Tentar Novamente", style: TextStyle(color: Cor.branco)),
            )
          ],
        ),
      )
          : viewModel.categorias.isEmpty
          ? const Center(child: Text("Nenhuma categoria encontrada."))
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: viewModel.categorias.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final categoria = viewModel.categorias[index];
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Cor.cinzaClaro,
              child: Icon(Icons.tag, color: Cor.branco),
            ),
            title: Text(
              categoria['CDCATNOME'] ?? 'Sem Nome',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Cor.azul),
                  onPressed: () async {
                    await Navigator.pushNamed(
                        context,
                        Routes.addCategoriaPage,
                        arguments: categoria
                    );
                    if (context.mounted) {
                      context.read<CategoriasViewmodel>().carregarCategorias();
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Cor.vermelho),
                  onPressed: () async {
                    final confirmar = await showDialog<bool>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Excluir Categoria"),
                        content: Text("Tem certeza que deseja excluir a categoria: '${categoria['CDCATNOME']}'?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx, false),
                            child: const Text("Cancelar", style: TextStyle(color: Cor.preto)),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(ctx, true),
                            child: const Text("Excluir", style: TextStyle(color: Cor.vermelho)),
                          ),
                        ],
                      ),
                    );

                    if (confirmar == true && context.mounted) {
                      final idParam = categoria['CDCATID'];
                      final sucesso = await context.read<CategoriasViewmodel>().deletarCategoria(context, idParam);
                      if (sucesso && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Excluído com sucesso!"), backgroundColor: Colors.green));
                      }
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
