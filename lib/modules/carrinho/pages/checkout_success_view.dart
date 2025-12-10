import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
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
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.basePage,
              (Route<dynamic> route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Color.fromRGBO(76, 175, 80, 1),
                  size: 100,
                ),
                const SizedBox(height: 30),

                FIDText(
                  baseText: "Pagamento Confirmado",
                  preset: FIDText.large,
                  fontWeight: FontWeight.bold,
                  padding: const {"bottom": 0.02},
                  textAlign: TextAlign.center,
                ),
                FIDText(
                  baseText: "Sua compra foi registrada com sucesso!",
                  preset: FIDText.medium,
                  padding: const {"bottom": 0.05},
                  textAlign: TextAlign.center,
                ),

                FIDButton(
                  text: "Voltar para Home",
                  preset: FIDButton.medium,
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.basePage,
                          (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}