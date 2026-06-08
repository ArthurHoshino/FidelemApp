import 'package:fidelem_app/modules/cliente/carrinho/componentes/carrinho_item_card.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import '../viewmodels/carrinho_viewmodel.dart';
import '../models/carrinho_model.dart';

class CarrinhoItemGrid extends StatelessWidget {
  final List<CarrinhoModel> items;
  final CarrinhoViewModel viewModel;

  const CarrinhoItemGrid({
    super.key, 
    required this.items, 
    required this.viewModel
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: FIDText(baseText: "Seu carrinho está vazio.", preset: FIDText.large),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CarrinhoItemCard(
          name: item.nome,
          price: item.preco,
          quantity: item.carrinhoData.lcCarQuantidade,
          imagem: item.imagem,
          onAdd: () => viewModel.adicionar(item),
          onRemove: () => viewModel.remover(item),
          onDelete: () => viewModel.excluir(item),
        );
      },
    );
  }
}