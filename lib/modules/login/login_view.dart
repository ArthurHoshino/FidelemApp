import 'package:fidelem_app/core/widgets/fid_line.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/app_logo.dart';
import 'package:fidelem_app/core/widgets/fid_input_box.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLogo(
      child: Column(
        children: [
          FIDText(baseText: "Seja bem-vindo(a)", preset: FIDText.large, textAlign: TextAlign.center),
          FIDText(baseText: "Entre com seu usuário e sua senha", padding: {"bottom": 0.03}, preset: FIDText.medium, textAlign: TextAlign.center),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FIDInputBox(text: "Usuário", padding: {"bottom": 0.03}, preset: FIDInputBox.medium),
              FIDInputBox(text: "Senha", padding: {"bottom": 0.01}, preset: FIDInputBox.medium),
              FIDText(linkText: "Esqueceu sua senha?", fontSize: 0.013, route: Routes.redefinirSenhaPage, preset: FIDText.link),
              FIDText(linkText: "Esqueceu sua senha?", fontSize: 0.013, route: Routes.configPage, preset: FIDText.link, textAlign: TextAlign.end ),
            ],
          ),
          FIDButton(text: "Login", preset: FIDButton.medium),
          FIDLine(preset: FIDLine.small),
          FIDText(baseText: "Não tem uma conta? ", linkText: "Registre-se", route: Routes.registroPage, preset: FIDText.link, textAlign: TextAlign.center ),
        ],
      )
    );
  }
}