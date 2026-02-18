import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/modules/cliente/carrinho/componentes/pagamento_cupom_card.dart';
import 'package:fidelem_app/modules/cliente/carrinho/componentes/pagamento_card.dart';
import 'package:fidelem_app/routes.dart';

class PagamentoView extends StatelessWidget {

  const PagamentoView({super.key});

  @override
  Widget build(BuildContext context) {
    final totalValue = ModalRoute.of(context)!.settings.arguments as double;

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
                      onPressed: () => Navigator.of(context).pop(),
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
                  FIDText(baseText: "Total a Pagar:", preset: FIDText.large, textAlign: TextAlign.start),
                  FIDText(
                    baseText: "R\$ ${totalValue.toStringAsFixed(2).replaceAll('.', ',')}",
                    preset: FIDText.large,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.end,
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
                isSelected: true,
                onTap: () {},
              ),
              PagamentoCard(
                title: "Cartão de Crédito",
                icon: Icons.credit_card,
                isEnabled: false,
                subtitle: "Em desenvolvimento",
              ),
              PagamentoCard(
                title: "PIX",
                icon: Icons.qr_code,
                isEnabled: false,
                subtitle: "Em desenvolvimento",
              ),
              PagamentoCard(
                title: "Boleto Bancário",
                icon: Icons.receipt_long,
                isEnabled: false,
                subtitle: "Em desenvolvimento",
              ),

              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FIDButton(
                    text: "Confirmar Pagamento",
                    preset: FIDButton.medium,
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.pedidoSuccessoPage);
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