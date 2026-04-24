import 'dart:io';
import 'package:fidelem_app/base_view.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/modules/mercado/inventario/componentes/add_edit_card.dart';
import 'package:fidelem_app/modules/mercado/inventario/componentes/add_edit_imagens.dart';
import 'package:flutter/services.dart';
import '../../../core/data/models/produto_entity.dart';
import '../../../core/widgets/fid_select_box.dart';
import 'package:fidelem_app/modules/mercado/inventario/add_edit_viewmodel.dart';
// import 'package:fidelem_app/modules/mercado/inventario/produto_model.dart' show deleteProdutoById;
// import 'package:fidelem_app/core/data/models/produto_model.dart' show deleteProdutoById;



class AddEditView extends StatefulWidget {
  final bool isEditing;
  final ProdutoEntity? prod;
  final int? produtoId;
  final Future<void> Function()? onChanged;

  const AddEditView({
    super.key,
    required this.isEditing,
    this.prod,
    this.produtoId,
    this.onChanged,
  });

  @override
  State<AddEditView> createState() => _AddEditViewState();
}

class _AddEditViewState extends State<AddEditView> {
  final AddEditViewmodel viewModel = AddEditViewmodel();

  List<File> listaImagens = [];
  int nImagem = 0;

  @override
  void initState() {
    super.initState();
    viewModel.carregarCategorias().then((_) {
      if (widget.isEditing == true){
        viewModel.setProdutoById(widget.produtoId);
      }
      setState(() {});
    });
  }

  void atualizaImagem() {
    setState(() {
      nImagem = listaImagens.length;
    });
  }

  @override
  void dispose() {
    viewModel.clear();
    viewModel.eanController.dispose();
    viewModel.nomeController.dispose();
    viewModel.descController.dispose();
    viewModel.estoqueController.dispose();
    viewModel.precoController.dispose();
    viewModel.categoriaController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Cor.branco,
      appBar: AppBar(
        title: Text(widget.isEditing ? "Editar produto" : "Adicionar produto"),
        centerTitle: true,
        backgroundColor: Cor.branco,
        foregroundColor: Cor.preto,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {

            widget.isEditing ? Navigator.pop(context) :
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BaseView(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top: 50, start: 25, end: 25,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FIDText(
              //   baseText: widget.isEditing ? "Altere os campos desejados" : "Adicione as informações do seu produto",
              //   fontSize: 0.018,
              //   color: Cor.preto,
              //   padding: const {"top": 0.0, "bottom": 0.05},
              // ),

              //  AddEditCard(
              //   label: "Código EAN",
              //   hint: "Insira o código do produto",
              //   controller: viewModel.eanController,
              // ),
              AddEditCard(
                label: "Nome do Produto",
                hint: "Insira o nome do produto",
                controller: viewModel.nomeController,
              ),
              AddEditCard(
                label: "Descrição",
                hint: "Insira uma breve descrição",
                controller: viewModel.descController,
              ),

              FIDText(
                baseText: "Categoria",
                fontSize: 0.018,
                color: Cor.preto,
                fontWeight: FontWeight.bold,
                padding: const {"top": 0.0, "bottom": 0.01},
              ),
              Row(
                children: [
                  Expanded(
                    child: FIDSelectBox(
                      items: viewModel.categorias,
                      preset: FIDSelectBox.medium,
                      controller: viewModel.categoriaController,
                      onChanged: (a) => {},
                    ),
                  ),

                  const SizedBox(width: 8),

                  IconButton(
                    icon: const Icon(Icons.refresh),
                    color: Cor.preto,
                    onPressed: () async {
                      viewModel.categoriaController.value = null;
                      await viewModel.carregarCategorias();
                      setState(() {}); // atualiza UI
                    },
                  ),
                ],
              ),
              AddEditCard(
                label: "Quantidade em estoque",
                hint: "Quantidade disponível em estoque",
                controller: viewModel.estoqueController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              AddEditCard(
                label: "Preço",
                hint: "Preço do Produto",
                controller: viewModel.precoController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true,),
                inputFormatters: [
                  TextInputFormatter.withFunction(
                        (oldValue, newValue) {
                      final regex = RegExp(r'^\d{0,5}([.,]\d{0,2})?$');

                      if (regex.hasMatch(newValue.text)) {
                        return newValue;
                      }
                      return oldValue;
                    },
                  ),
                ],
              ),

              AddEditCard(
                label: "Preço (em desconto)",
                hint: "Preço do Produto (em desconto)",
                controller: viewModel.descontoController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true,),
                inputFormatters: [
                  TextInputFormatter.withFunction(
                        (oldValue, newValue) {
                      final regex = RegExp(r'^\d{0,5}([.,]\d{0,2})?$');

                      if (regex.hasMatch(newValue.text)) {
                        return newValue;
                      }
                      return oldValue;
                    },
                  ),
                ],
              ),

              AddEditCard(
                label: "Pontos",
                hint: "Preço do Produto em pontos",
                controller: viewModel.pontoController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),

              AddEditImagens(
                nImagem: nImagem,
                listaImagens: listaImagens,
                onUpdate: atualizaImagem,
              ),

              SizedBox(height: 5),
              Row(
                children: [

                  Expanded(
                    child: FIDButton(
                      text: widget.isEditing
                          ? "Confirmar"
                          : "+ Adicionar",
                      preset: FIDButton.big,
                      padding: const {"top": 0.02},
                      onPressed: () async {

                        if (widget.isEditing) {
                          await viewModel.atualizarProduto(context);
                        } else {
                          await viewModel.inserirProduto(context);
                        }

                        if (widget.onChanged != null) {
                          await widget.onChanged!();
                        }

                        if (widget.isEditing) {
                          Navigator.pop(context, true);
                        }
                      },
                    ),
                  ),

                  if (widget.isEditing && widget.produtoId != null)
                    const SizedBox(width: 12),

                  if (widget.isEditing && widget.produtoId != null)
                    Expanded(
                      child: FIDButton(
                        text: "Deletar",
                        preset: FIDButton.big,
                        padding: const {"top": 0.02},
                        borderColor: Colors.redAccent,
                        BGColor: Colors.redAccent,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Excluir produto"),
                                content: const Text(
                                  "Tem certeza que deseja excluir este produto?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancelar"),
                                  ),

                                  TextButton(
                                    onPressed: () async {

                                      await deleteProdutoById(
                                        context,
                                        widget.produtoId as int,
                                      );

                                      if (widget.onChanged != null) {
                                        await widget.onChanged!();
                                      }

                                      await Future.delayed(
                                        const Duration(milliseconds: 300),
                                      );

                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop(true);
                                    },
                                    child: const Text(
                                      "Confirmar",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: widget.isEditing
          ? SafeArea(child: SizedBox(height: 30))
          : null,
    );

  }
}