import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/modules/cliente/carrinho/componentes/pagamento_cupom_card.dart';
import 'package:fidelem_app/modules/cliente/carrinho/componentes/pagamento_card.dart';
import 'package:fidelem_app/core/services/cart_manager.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class PagamentoView extends StatefulWidget {
  final Function(int, {double? total})? onPressed;
  final double total;
  const PagamentoView({super.key, this.onPressed, required this.total});

  @override
  State<PagamentoView> createState() => _PagamentoViewState();
}

class _PagamentoViewState extends State<PagamentoView> {
  String selectedMetodo = 'dinheiro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        widget.onPressed!(4);
                      },
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                      iconSize: 30,
                    ),
                  ),
                  Expanded(
                    child: FIDText(
                      baseText: "Métodos de Pagamentos",
                      preset: FIDText.large,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FIDText(
                    baseText: selectedMetodo == 'pontos' ? "Total a Pagar:" : "Total a Pagar:",
                    preset: FIDText.large,
                    textAlign: TextAlign.start,
                  ),
                  FIDText(
                    baseText: selectedMetodo == 'pontos'
                        ? "${CartManager.instance.totalPoints} pontos"
                        : "R\$ ${widget.total.toStringAsFixed(2).replaceAll('.', ',')}",
                    preset: FIDText.large,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.end,
                    color: selectedMetodo == 'pontos' ? Cor.vermelho : Cor.preto,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const PagamentoCupom(),
              FIDText(
                baseText: "Selecione a forma de pagamento:",
                preset: FIDText.medium,
                padding: const {"bottom": 0.01},
                textAlign: TextAlign.start,
              ),
              PagamentoCard(
                title: "Dinheiro",
                icon: Icons.money,
                isEnabled: true,
                isSelected: selectedMetodo == 'dinheiro',
                onTap: () {
                  setState(() {
                    selectedMetodo = 'dinheiro';
                  });
                },
              ),
              PagamentoCard(
                title: "Cartão de Crédito",
                icon: Icons.credit_card,
                isEnabled: true,
                isSelected: selectedMetodo == 'cartao',
                onTap: () {
                  setState(() {
                    selectedMetodo = 'cartao';
                  });
                },
              ),
              PagamentoCard(
                title: "PIX",
                icon: Icons.qr_code,
                isEnabled: true,
                isSelected: selectedMetodo == 'pix',
                onTap: () {
                  setState(() {
                    selectedMetodo = 'pix';
                  });
                },
              ),
              PagamentoCard(
                title: "Pontos de Fidelidade",
                icon: Icons.star_border,
                isEnabled: true,
                isSelected: selectedMetodo == 'pontos',
                subtitle: "${CartManager.instance.totalPoints} pontos acumulados na compra",
                onTap: () {
                  setState(() {
                    selectedMetodo = 'pontos';
                  });
                },
              ),

              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FIDButton(
                    text: "Confirmar Pagamento",
                    preset: FIDButton.medium,
                    onPressed: () async {
                      final error = await CartManager.instance.finalizeCart(selectedMetodo);
                      if (error != null) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(error),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
                      } else {
                        if (context.mounted) {
                          widget.onPressed!(5);
                        }
                      }
                    },
                    padding: const {"bottom": 0.01},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}