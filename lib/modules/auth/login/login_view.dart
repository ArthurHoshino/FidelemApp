import 'package:fidelem_app/core/widgets/fid_line.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_logo.dart';
import 'package:fidelem_app/core/widgets/fid_input_box.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/modules/auth/login/login_viewmodel.dart';
import 'package:fidelem_app/core/widgets/fid_select_box.dart';

class LoginView extends StatefulWidget{
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Instancia o ViewModel
  final LoginViewModel viewModel = LoginViewModel();

  @override
  void dispose() {
    // Limpeza dos controladores quando sair da tela
    viewModel.usuarioController.dispose();
    viewModel.senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // O ListenableBuilder escuta as mudanças no viewModel (notifyListeners)
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Scaffold(
          body: FidLogo(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FIDText(baseText: "Seja bem-vindo(a)",
                      preset: FIDText.large,
                      textAlign: TextAlign.center),
                  FIDText(baseText: "Entre com seu usuário e sua senha",
                      padding: {"bottom": 0.03},
                      preset: FIDText.medium,
                      textAlign: TextAlign.center),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FIDInputBox(text: "E-mail",
                          preset: FIDInputBox.medium,
                          controller: viewModel.usuarioController),
                      FIDInputBox(text: "Senha",
                          preset: FIDInputBox.medium,
                          controller: viewModel.senhaController,
                          obscureText: true),
                      FIDSelectBox(
                          items: viewModel.empresasNomes,
                          preset: FIDSelectBox.medium,
                          controller: viewModel.empresaController,
                          onChanged: (item) => {
                            print(item)
                          },
                          text: "Empresa",
                      ),
                      FIDText(linkText: "Esqueceu sua senha?",
                          fontSize: 0.013,
                          route: Routes.redefinirSenhaPage,
                          preset: FIDText.link,
                          textAlign: TextAlign.center),
                    ],
                  ),

                  FIDButton(text: "Login", preset: FIDButton.medium, onPressed: () => {
                    viewModel.login(context)
                  },),
                  FIDLine(preset: FIDLine.small),
                  FIDText(baseText: "Não tem uma conta? ",
                      linkText: "Registre-se",
                      route: Routes.registroPage,
                      preset: FIDText.link,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
