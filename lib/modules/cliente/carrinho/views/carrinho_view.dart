import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_header.dart';
import '../viewmodels/carrinho_viewmodel.dart';
import '../componentes/carrinho_item_grid.dart';
import '../componentes/carrinho_checkout_card.dart';

class CarrinhoView extends StatefulWidget {

  final Function(int index, {double? total})? onPressed;
  const CarrinhoView({super.key, this.onPressed});

  @override
  State<CarrinhoView> createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {
  final CarrinhoViewModel viewModel = CarrinhoViewModel();

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            final total = viewModel.total.toDouble();
            return Column(
              children: [
                const FIDHeader(),
                
                Expanded(
                  child: CarrinhoItemGrid(
                    items: viewModel.items,
                    viewModel: viewModel,
                  ),
                ),

                if (viewModel.items.isNotEmpty) 
                  CarrinhoCheckout(total: total, onPressed: () => widget.onPressed!(4, total: total)),
              ],
            );
          },
        ),
      ),
    );
  }
}