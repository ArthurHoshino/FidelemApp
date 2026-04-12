import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/modules/mercado/funcionarios/funcionarios_viewmodel.dart';
import 'package:provider/provider.dart';

class FuncionariosView extends StatelessWidget {
  const FuncionariosView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FuncionariosViewModel(),
      child: const _FuncionariosContent(),
    );
  }
}

class _FuncionariosContent extends StatelessWidget {
  const _FuncionariosContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FuncionariosViewModel>();

    return Scaffold(
      backgroundColor: Cor.branco,
      appBar: AppBar(
        title: const Text("Gerenciar Funcionários"),
        centerTitle: true,
        backgroundColor: Cor.branco,
        foregroundColor: Cor.preto,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Cor.azul,
        onPressed: () async {
          // Navega para add page
          await Navigator.pushNamed(context, Routes.addFuncionarioPage);
          // Atualiza lista ao voltar
          if (context.mounted) {
            context.read<FuncionariosViewModel>().carregarFuncionarios();
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
                        onPressed: viewModel.carregarFuncionarios,
                        style: ElevatedButton.styleFrom(backgroundColor: Cor.azul),
                        child: const Text("Tentar Novamente", style: TextStyle(color: Cor.branco)),
                      )
                    ],
                  ),
                )
              : viewModel.funcionarios.isEmpty
                  ? const Center(child: Text("Nenhum funcionário encontrado."))
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: viewModel.funcionarios.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final funcionario = viewModel.funcionarios[index];
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Cor.cinzaClaro,
                            child: Icon(Icons.person, color: Cor.branco),
                          ),
                          title: Text(
                            funcionario['CDSENOME'] ?? 'Sem Nome',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            funcionario['CDCARNOME'] ?? 'Cargo Desconhecido',
                            style: const TextStyle(color: Cor.cinzaEscuro),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Cor.azul),
                                onPressed: () async {
                                  await Navigator.pushNamed(
                                    context, 
                                    Routes.addFuncionarioPage, 
                                    arguments: funcionario
                                  );
                                  // Recarrega atualizações quando retornar da edicao
                                  if (context.mounted) {
                                    context.read<FuncionariosViewModel>().carregarFuncionarios();
                                  }
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Cor.vermelho),
                                onPressed: () async {
                                  final confirmar = await showDialog<bool>(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: const Text("Excluir Funcionário"),
                                      content: Text("Tem certeza que deseja excluir o funcionário '${funcionario['CDSENOME']}'?"),
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
                                    final idParam = funcionario['CDSEID'];
                                    final sucesso = await context.read<FuncionariosViewModel>().deletarFuncionario(context, idParam);
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
