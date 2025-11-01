import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/modules/carrinho/components/coupon_selector.dart';
import 'package:fidelem_app/modules/carrinho/components/payment_method_tile.dart';
import 'package:fidelem_app/routes.dart';

class PaymentSelectionView extends StatelessWidget {
  final double totalValue = 735.50;

  const PaymentSelectionView({super.key});

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
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  FIDText(
                    baseText: "Método de Pagamento",
                    preset: FIDText.large,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FIDText(baseText: "Total a Pagar:", preset: FIDText.medium, textAlign: TextAlign.start),
                  FIDText(
                    baseText: "R\$ ${totalValue.toStringAsFixed(2).replaceAll('.', ',')}",
                    preset: FIDText.large,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CouponSelector(),
              FIDText(
                baseText: "Selecione a forma de pagamento:",
                preset: FIDText.medium,
                padding: const {"bottom": 0.01},
                textAlign: TextAlign.start,
              ),
              PaymentMethodTile(
                title: "Dinheiro",
                icon: Icons.money,
                isEnabled: true,
                onTap: () {},
              ),
              PaymentMethodTile(
                title: "Cartão de Crédito",
                icon: Icons.credit_card,
                isEnabled: false,
                subtitle: "Em desenvolvimento",
              ),
              PaymentMethodTile(
                title: "PIX",
                icon: Icons.qr_code,
                isEnabled: false,
                subtitle: "Em desenvolvimento",
              ),
              PaymentMethodTile(
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
                      Navigator.of(context).pushNamed(Routes.checkoutSuccessPage);
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