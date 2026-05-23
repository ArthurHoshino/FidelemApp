import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/modules/mercado/cargos/cargos_viewmodel.dart';
import 'package:provider/provider.dart';

class CargosView extends StatelessWidget {
  const CargosView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CargosViewModel(),
      child: const _CargosContent(),
    );
  }
}

class _CargosContent extends StatelessWidget {
  const _CargosContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CargosViewModel>();

    return Scaffold(
      backgroundColor: Cor.branco,
      appBar: AppBar(
        title: const Text("Gerenciar Cargos"),
        centerTitle: true,
        backgroundColor: Cor.branco,
        foregroundColor: Cor.preto,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Cor.azul,
        onPressed: () async {
          await Navigator.pushNamed(context, Routes.addCargoPage);
          if (context.mounted) {
            context.read<CargosViewModel>().carregarCargos();
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
                        onPressed: viewModel.carregarCargos,
                        style: ElevatedButton.styleFrom(backgroundColor: Cor.azul),
                        child: const Text("Tentar Novamente", style: TextStyle(color: Cor.branco)),
                      )
                    ],
                  ),
                )
              : viewModel.cargos.isEmpty
                  ? const Center(child: Text("Nenhum cargo encontrado."))
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: viewModel.cargos.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final cargo = viewModel.cargos[index];
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Cor.cinzaClaro,
                            child: Icon(Icons.badge, color: Cor.branco),
                          ),
                          title: Text(
                            cargo.descricao,
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
                                    Routes.addCargoPage, 
                                    arguments: cargo
                                  );
                                  if (context.mounted) {
                                    context.read<CargosViewModel>().carregarCargos();
                                  }
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Cor.vermelho),
                                onPressed: () async {
                                  final confirmar = await showDialog<bool>(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: const Text("Excluir Cargo"),
                                      content: Text("Tem certeza que deseja excluir o cargo '${cargo.descricao}'?"),
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
                                    final sucesso = await context.read<CargosViewModel>().deletarCargo(context, cargo.id);
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
