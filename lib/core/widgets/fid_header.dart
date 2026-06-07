import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/main.dart';

class FIDHeader extends StatelessWidget {
  const FIDHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        height: 50,
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("lib/core/assets/logo/Logo_FidelemApp_2.png"),
                backgroundColor: Cor.transparente,
              ),
            ),

            Center(
              child: FIDText(
                baseText: "Fidelem App",
                preset: FIDText.medium,
                textAlign: TextAlign.center,
                color: Cor.preto,
                fontWeight: FontWeight.bold,
                padding: const {"top": 0, "bottom": 0, "left": 0, "right": 0},
              ),
            ),

            ListenableBuilder(
              listenable: MyApp.dadosUsuarioNotifier,
              builder: (context, child) {
                final user = MyApp.dadosUsuario;
                if (user != null && user.isCliente) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Cor.azul.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Cor.azul.withOpacity(0.2)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.stars_rounded,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${user.pontos} pts",
                            style: const TextStyle(
                              color: Cor.preto,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}