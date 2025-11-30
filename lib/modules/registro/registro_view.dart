import 'package:fidelem_app/core/widgets/fid_line.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/app_logo.dart';
import 'package:fidelem_app/core/widgets/fid_input_box.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/routes.dart';

class RegistroView extends StatelessWidget {
  const RegistroView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLogo(
        child: Column(
          children: [
            FIDText(baseText: "Registro", preset: FIDText.large, textAlign: TextAlign.center,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FIDText(baseText: "Insira seus dados", preset: FIDText.medium, textAlign: TextAlign.center,),
                FIDInputBox(text: "Nome", preset: FIDInputBox.medium),
                FIDInputBox(text: "Email", preset: FIDInputBox.medium),
                FIDInputBox(text: "Senha", preset: FIDInputBox.medium),
                FIDInputBox(text: "Confirme sua senha", padding: {"bottom": 0.03}, preset: FIDInputBox.medium),
              ],
            ),
            FIDButton(text: "Criar", preset: FIDButton.medium),
            FIDLine(preset: FIDLine.small),
            FIDText(baseText: "Já tem uma conta? ", linkText: "Entre", route: Routes.loginPage, preset: FIDText.link, textAlign: TextAlign.center,),
          ],
        )
    );
  }
}