import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class PedidoSucessoView extends StatefulWidget {

  final Function(int)? onPressed;
  const PedidoSucessoView({super.key, this.onPressed});

  @override
  State<PedidoSucessoView> createState() => _PedidoSucessoViewState();
}

class _PedidoSucessoViewState extends State<PedidoSucessoView> {
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
                  color: Cor.verde,
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
                  onPressed: () {widget.onPressed!(0);},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}