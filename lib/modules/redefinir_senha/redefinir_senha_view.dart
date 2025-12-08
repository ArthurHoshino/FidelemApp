import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/app_logo.dart';
import 'package:fidelem_app/core/widgets/fid_input_box.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/modules/redefinir_senha/redefinir_senha_viewmodel.dart';
import 'package:fidelem_app/core/widgets/fid_select_box.dart';

class RedefinirSenhaView extends StatefulWidget {
  const RedefinirSenhaView({super.key});

  @override
  State<RedefinirSenhaView> createState() => _RedefinirSenhaViewState();
}

class _RedefinirSenhaViewState extends State<RedefinirSenhaView> {
  // Instancia o ViewModel
  final RedefinirSenhaViewmodel viewModel = RedefinirSenhaViewmodel();

  @override
  void dispose() {
    viewModel.senhaAntigaController.dispose();
    viewModel.emailController.dispose();
    viewModel.senhaNovaController.dispose();
    viewModel.senhaNovaConfirmaController.dispose();
    viewModel.empresaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // O ListenableBuilder escuta as mudanças no viewModel (notifyListeners)
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Scaffold(
          body: AppLogo(
            child: Column(
              children: [
                FIDText(baseText: "Redefinir Senha",
                    preset: FIDText.large,
                    textAlign: TextAlign.center),
                FIDSelectBox(text: "Empresa",
                    items: viewModel.empresasNomes,
                    preset: FIDSelectBox.medium,
                    controller: viewModel.empresaController,
                    onChanged: (item) =>
                    {
                      print(item)
                    },
                ),
                FIDInputBox(
                    text: "Informe seu email", preset: FIDInputBox.medium, controller: viewModel.emailController,),
                FIDInputBox(
                    text: "Informe a senha antiga", preset: FIDInputBox.medium, obscureText: true,controller: viewModel.senhaAntigaController,),
                FIDInputBox(
                    text: "Insira a nova senha", preset: FIDInputBox.medium, obscureText: true,controller: viewModel.senhaNovaController,),
                FIDInputBox(text: "Confirme a nova senha",
                    padding: {"bottom": 0.03},
                    preset: FIDInputBox.medium,
                    obscureText: true,
                    controller: viewModel.senhaNovaConfirmaController,),
                FIDButton(text: "Enviar", preset: FIDButton.medium, padding: {"bottom": 0.03}, onPressed: () => {
                  viewModel.redefinir(context)
                },),
                FIDButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginPage);
                    },
                    text: "Cancelar",
                    borderColor: Color.fromARGB(255, 210, 210, 210),
                    BGColor: Color.fromARGB(255, 255, 255, 255),
                    textColor: Color.fromARGB(255, 48, 48, 48),
                    preset: FIDButton.medium
                ),
              ],
            )
          ),
        );
      }
    );
  }
}