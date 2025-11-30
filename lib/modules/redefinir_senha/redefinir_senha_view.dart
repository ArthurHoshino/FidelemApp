import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/app_logo.dart';
import 'package:fidelem_app/core/widgets/fid_input_box.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/routes.dart';

class RedefinirSenhaView extends StatelessWidget {
  const RedefinirSenhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLogo(
      child: Column(
        children: [
          FIDText(baseText: "Redefinir Senha", preset: FIDText.large, textAlign: TextAlign.center),
          FIDInputBox(text: "Confirme a senha antiga", padding: {"bottom": 0.03}, preset: FIDInputBox.medium),
          FIDInputBox(text: "Insira a nova senha", padding: {"bottom": 0.03}, preset: FIDInputBox.medium),
          FIDInputBox(text: "Confirme a nova senha", padding: {"bottom": 0.05}, preset: FIDInputBox.medium),
          FIDButton(text: "Enviar", padding: {"bottom": 0.03}, preset: FIDButton.medium),
          FIDButton(
            onPressed: () {Navigator.pushNamed(context, Routes.registroPage);}, 
            text: "Cancelar", 
            borderColor: Color.fromARGB(255, 210, 210, 210), 
            BGColor: Color.fromARGB(255, 255, 255, 255), 
            textColor: Color.fromARGB(255, 48, 48, 48), 
            preset: FIDButton.medium
          ),
        ],
      )
    );
  }
}