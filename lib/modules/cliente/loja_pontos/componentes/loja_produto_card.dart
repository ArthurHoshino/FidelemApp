import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/modules/cliente/loja_pontos/loja_pontos_model.dart';
import 'package:fidelem_app/core/services/cart_manager.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/core/data/models/entity.dart';

class LojaProdutoCard extends StatelessWidget {
  final LojaPontosModel produto;
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
        color: Cor.branco,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Cor.cinzaClaro,
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
            child: InkWell(
              onTap: () {
                final int? idInt = int.tryParse(produto.id);
                if (idInt != null) {
                  final prodEntity = CartManager.instance.allProducts.firstWhere(
                    (p) => p.id == idInt,
                    orElse: () => ProdutoEntity(
                      id: idInt,
                      nome: produto.nome,
                      descricao: '',
                      precoReal: produto.preco,
                      precoPonto: produto.pontos,
                      qtdEstoque: 0,
                      imagem: produto.imagem,
                    ),
                  );
                  Navigator.of(context).pushNamed(
                    Routes.produtoDetalhePage,
                    arguments: prodEntity,
                  );
                }
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Cor.azulClaro1, 
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Center(
                    child: _buildImage(produto.imagem),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    final int? idInt = int.tryParse(produto.id);
                    if (idInt != null) {
                      final prodEntity = CartManager.instance.allProducts.firstWhere(
                        (p) => p.id == idInt,
                        orElse: () => ProdutoEntity(
                          id: idInt,
                          nome: produto.nome,
                          descricao: '',
                          precoReal: produto.preco,
                          precoPonto: produto.pontos,
                          qtdEstoque: 0,
                          imagem: produto.imagem,
                        ),
                      );
                      Navigator.of(context).pushNamed(
                        Routes.produtoDetalhePage,
                        arguments: prodEntity,
                      );
                    }
                  },
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
                              color: Cor.preto,
                              textAlign: TextAlign.left,
                              fontSize: 0.015,
                            ),
                            Container(
                              width: 1.5,
                              height: double.infinity,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              color: Cor.cinzaClaro,
                            ),
                            FIDText(
                              baseText: produto.pontos > 0 ? "${produto.pontos}pts" : "S/ pontos",
                              preset: FIDText.medium,
                              fontWeight: FontWeight.bold,
                              color: produto.pontos > 0 ? Cor.vermelho : Cor.cinzaEscuro, 
                              textAlign: TextAlign.left,
                              fontSize: produto.pontos > 0 ? 0.015 : 0.012,
                            ),
                          ],
                        ),
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
                        side: const BorderSide(color: Cor.azul, width: 1),
                        foregroundColor: Cor.azul, 
                        backgroundColor: Cor.branco, 
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
                       border: Border.all(color: Cor.azul, width: 1.5),
                       borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildControl(
                          icon: Icons.remove,
                          iconColor: Cor.azul,
                          onTap: () => onUpdateCart(-1),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "${produto.quantidadeNoCarrinho}",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Cor.preto),
                          ),
                        ),

                        buildControl(
                          icon: Icons.add,
                          iconColor: Cor.azul,
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

  Widget buildControl({
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
    Color color = Cor.transparente, 
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

  Widget _buildImage(String imagem) {
    if (imagem.isEmpty) {
      return const Center(
        child: Icon(Icons.image, color: Cor.azul, size: 60),
      );
    }
    if (imagem.startsWith('assets/')) {
      return Image.asset(
        imagem,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    try {
      return Image.memory(
        base64Decode(imagem),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    } catch (_) {
      return const Center(
        child: Icon(Icons.image_not_supported, color: Cor.azul, size: 60),
      );
    }
  }
}