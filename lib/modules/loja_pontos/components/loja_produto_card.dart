import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';

class Produto {
  final String id;
  final String nome;
  final double preco;
  final int pontos;
  final String imagem;
  final int quantidadeNoCarrinho; 

  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.pontos,
    required this.imagem,
    this.quantidadeNoCarrinho = 0,
  });
}
class LojaProdutoCard extends StatelessWidget {
  final Produto produto;
  final Function(int) onUpdateCart; 

  const LojaProdutoCard({
    super.key,
    required this.produto,
    required this.onUpdateCart,
  });

  @override
  Widget build(BuildContext context) {
    final bool isInCart = produto.quantidadeNoCarrinho > 0;
    final double priceLineHeight = MediaQuery.of(context).size.height * 0.03;

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(238, 238, 238, 1), 
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                image: produto.imagem.isNotEmpty
                    ? DecorationImage(
                        image: AssetImage(produto.imagem),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: produto.imagem.isEmpty
                  ? const Icon(Icons.image_not_supported, color: Color.fromRGBO(158, 158, 158, 1), size: 40)
                  : null,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FIDText(
                  baseText: produto.nome,
                  preset: FIDText.medium,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 4),
                
                SizedBox(
                  height: priceLineHeight,
                  child: Row(
                    children: [
                      FIDText(
                        baseText: "R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}",
                        preset: FIDText.medium,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(0, 0, 0, 0.867),
                        textAlign: TextAlign.left,
                        fontSize: 0.015,
                      ),
                      const Text(" | ", style: TextStyle(color: Color.fromRGBO(158, 158, 158, 1))),
                      FIDText(
                        baseText: "${produto.pontos}pts",
                        preset: FIDText.medium,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(233, 30, 99, 1), 
                        textAlign: TextAlign.left,
                        fontSize: 0.015,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 8),

                if (!isInCart)
                  SizedBox(
                    height: 36, 
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => onUpdateCart(1),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color.fromRGBO(33, 150, 243, 1), width: 1),
                        foregroundColor: const Color.fromRGBO(33, 150, 243, 1), 
                        backgroundColor: const Color.fromRGBO(255, 255, 255, 1), 
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), 
                      ),
                      child: const Text(
                        "Adicionar ao Carrinho", 
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                else
                  Container(
                    height: 36,
                    decoration: BoxDecoration(
                       border: Border.all(color: const Color.fromRGBO(33, 150, 243, 1), width: 1.5),
                       borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildControl(
                          icon: Icons.remove,
                          iconColor: const Color.fromRGBO(33, 150, 243, 1),
                          onTap: () => onUpdateCart(-1),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "${produto.quantidadeNoCarrinho}",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.867)),
                          ),
                        ),

                        _buildControl(
                          icon: Icons.add,
                          iconColor: const Color.fromRGBO(33, 150, 243, 1),
                          onTap: () => onUpdateCart(1),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControl({
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
    Color color = const Color.fromRGBO(0, 0, 0, 0), 
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 36,
          decoration: BoxDecoration(
            color: color, 
            borderRadius: BorderRadius.horizontal(
              left: icon == Icons.delete_outline ? const Radius.circular(18) : Radius.zero,
              right: icon == Icons.add ? const Radius.circular(18) : Radius.zero,
            ),
          ),
          child: Center(
            child: Icon(icon, size: 20, color: iconColor),
          ),
        ),
      ),
    );
  }
}