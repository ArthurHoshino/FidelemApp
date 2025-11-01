import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/routes.dart';
import 'dart:async';

class CheckoutSuccessView extends StatefulWidget {
  const CheckoutSuccessView({super.key});

  @override
  State<CheckoutSuccessView> createState() => _CheckoutSuccessViewState();
}

class _CheckoutSuccessViewState extends State<CheckoutSuccessView> {
  
  @override
  void initState() {
    super.initState();
    // Espera 3 segundos e navega para a Home
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.homePage, 
          (Route<dynamic> route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 100,
              ),
              const SizedBox(height: 20),
              
              FIDText(
                baseText: "Pagamento Confirmado (Mock)",
                preset: FIDText.large,
                fontWeight: FontWeight.bold,
                padding: const {"bottom": 0.01},
                textAlign: TextAlign.center,
              ),
              FIDText(
                baseText: "Sua compra foi registrada com sucesso!",
                preset: FIDText.medium,
                padding: const {"bottom": 0.03},
                textAlign: TextAlign.center,
              ),
              
              FIDText(
                baseText: "--- TELA PROVISÓRIA DE FINALIZAÇÃO ---",
                preset: FIDText.small,
                color: Colors.red,
                textAlign: TextAlign.center,
                padding: const {"bottom": 0.01},
              ),
              FIDText(
                baseText: "Nenhuma transação financeira real foi efetuada. Você será redirecionado em breve.",
                preset: FIDText.small,
                color: Colors.orange,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}