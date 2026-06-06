import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/core/widgets/fid_input_box.dart';
import 'package:fidelem_app/modules/mercado/cargos/cargos_add_viewmodel.dart';
import 'package:fidelem_app/core/data/models/cargo_entity.dart';
import 'package:provider/provider.dart';

class CargosAddView extends StatelessWidget {
  const CargosAddView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as CargoEntity?;

    return ChangeNotifierProvider(
      create: (_) => CargosAddViewModel(cargoEditado: args),
      child: const _CargosAddContent(),
    );
  }
}

class _CargosAddContent extends StatelessWidget {
  const _CargosAddContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CargosAddViewModel>();
    final isEdit = viewModel.cargoEditado != null;

    return Scaffold(
      backgroundColor: Cor.branco,
      appBar: AppBar(
        title: Text(isEdit ? "Editar Cargo" : "Novo Cargo"),
        centerTitle: true,
        backgroundColor: Cor.branco,
        foregroundColor: Cor.preto,
        elevation: 0,
      ),
      body: viewModel.isLoadingPrivilegios
        ? const Center(child: CircularProgressIndicator(color: Cor.azul))
        : SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(isEdit ? "Editar o cargo" : "Dados do Cargo", 
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: 24),
                
                // Nome do cargo
                FIDInputBox(
                  preset: FIDInputBox.medium,
                  text: "Nome do Cargo",
                  controller: viewModel.nomeController,
                  width: 0.9,
                ),
                
                const SizedBox(height: 32),
                const Text("Privilégios de Acesso", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),

                // Lista de privilégios por módulo
                ...viewModel.privilegiosPorModulo.entries.map((entry) {
                  final modulo = entry.key;
                  final privilegios = entry.value;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 1,
                    color: Cor.branco,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: const BoxDecoration(
                            color: Cor.azulClaro1,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
                          ),
                          child: Text(
                            modulo,
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Cor.azul),
                          ),
                        ),
                        ...privilegios.map((priv) {
                          return CheckboxListTile(
                            title: Text(priv.nome),
                            value: viewModel.privilegiosSelecionados.contains(priv.id),
                            onChanged: (val) => viewModel.togglePrivilegio(priv.id, val),
                            activeColor: Cor.azul,
                            controlAffinity: ListTileControlAffinity.leading,
                          );
                        }),
                      ],
                    ),
                  );
                }),

                const SizedBox(height: 24),

                // Botão Salvar
                viewModel.isSaving
                    ? const CircularProgressIndicator(color: Cor.azul)
                    : FIDButton(
                        preset: FIDButton.big,
                        text: "SALVAR",
                        onPressed: () async {
                          final success = await viewModel.salvarCargo(context);
                          if (success && context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Cargo salvo com sucesso!"), backgroundColor: Colors.green),
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
