import 'package:fidelem_app/core/widgets/fid_chat.dart';
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

  // Método responsável por levantar o painel do Chat
  void _abrirChatIA(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Essencial para permitir que o modal passe de 50% da tela
      backgroundColor: Colors.transparent, // Deixa transparente para vermos as bordas arredondadas do container
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.90,
          minChildSize: 0.50,
          maxChildSize: 0.95,
          builder: (_, scrollController) {
            return FidChat(viewModel: viewModel);
          },
        );
      },
    );
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
                  CarrinhoCheckout(
                    total: total, 
                    onPressed: () => widget.onPressed!(4, total: total)
                  ),
              ],
            );
          },
        ),
      ),
      // O botão que aciona o método que criamos acima
      floatingActionButton: FloatingActionButton(
        onPressed: () => _abrirChatIA(context),
        backgroundColor: Colors.blueAccent, // Ajuste para a cor primária do seu app
        child: const Icon(Icons.chat_bubble_outline, color: Colors.white),
      ),
      // Se o seu CarrinhoCheckout ficar muito no fundo da tela, isso evita que o botão flutue por cima dele
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}