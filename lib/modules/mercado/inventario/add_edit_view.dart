import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/modules/mercado/inventario/componentes/add_edit_card.dart';
import 'package:fidelem_app/modules/mercado/inventario/componentes/add_edit_imagens.dart';

class AddEditView extends StatefulWidget {
  final bool isEditing;

  const AddEditView({super.key, required this.isEditing});

  @override
  State<AddEditView> createState() => _AddEditViewState();
}

class _AddEditViewState extends State<AddEditView> {
  final TextEditingController eanController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController estoqueController = TextEditingController();
  final TextEditingController precoController = TextEditingController();

  List<File> listaImagens = []; 
  int nImagem = 0;

  void atualizaImagem() {
    setState(() {
      nImagem = listaImagens.length;
    });
  }

  @override
  void dispose() {
    eanController.dispose();
    nomeController.dispose();
    descController.dispose();
    estoqueController.dispose();
    precoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cor.branco,
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top: 50, start: 25, end: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FIDText(
                baseText: widget.isEditing ? "Editar Produto" : "Adicionar Produto",
                fontSize: 0.024,
                fontWeight: FontWeight.bold,
                color: Cor.preto,
                padding: const {"top": 0.05, "bottom": 0.01},
              ),
              FIDText(
                baseText: widget.isEditing ? "Altere os campos desejados" : "Adicione as informações do seu produto",
                fontSize: 0.018,
                color: Cor.preto,
                padding: const {"top": 0.0, "bottom": 0.05},
              ),
              
              AddEditCard(label: "Código EAN", hint: "Insira o código do produto", controller: eanController),
              AddEditCard(label: "Nome do Produto", hint: "Insira o nome do produto", controller: nomeController),
              AddEditCard(label: "Descrição", hint: "Insira uma breve descrição", controller: descController),
              AddEditCard(label: "Quantidade em estoque", hint: "Quantidade disponível em estoque", controller: estoqueController),
              AddEditCard(label: "Preço", hint: "Preço do Produto", controller: precoController),

              AddEditImagens(
                nImagem: nImagem,
                listaImagens: listaImagens,
                onUpdate: atualizaImagem,
              ),

              FIDButton(
                text: widget.isEditing ? "Confirmar Alterações" : "+ Adicionar",
                preset: FIDButton.big,
                padding: const {"top": 0.02},
                onPressed: () {
                  print("Enviando: ${nomeController.text}");
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}