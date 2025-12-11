import 'package:fidelem_app/core/widgets/fid_line.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/app_logo.dart';
import 'package:fidelem_app/core/widgets/fid_input_box.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/modules/registro/registro_viewmodel.dart';
import 'package:fidelem_app/core/widgets/fid_select_box.dart';

class RegistroView extends StatefulWidget {
  const RegistroView({super.key});

  @override
  State<RegistroView> createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  // Instancia o ViewModel
  final RegistroViewModel viewModel = RegistroViewModel();

  @override
  void dispose() {
    viewModel.nomeController.dispose();
    viewModel.emailController.dispose();
    viewModel.senhaController.dispose();
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 30, top: 0),
              child: Column(
                children: [
                  FIDText(baseText: "Registro",
                    preset: FIDText.large,
                    textAlign: TextAlign.center,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FIDText(baseText: "Insira seus dados",
                        preset: FIDText.medium,
                        textAlign: TextAlign.center,),
                      FIDInputBox(text: "Nome", preset: FIDInputBox.medium, controller: viewModel.nomeController,),
                      FIDInputBox(text: "Email", preset: FIDInputBox.medium, controller: viewModel.emailController,),
                      FIDInputBox(text: "Senha", preset: FIDInputBox.medium, controller: viewModel.senhaController, obscureText: true,),

                      FIDInputBox(text: "Confirme sua senha",
                          preset: FIDInputBox.medium,
                          obscureText: true,
                          controller: viewModel.senhaConfirmaController,),
                      FIDSelectBox(text: "Empresa",
                          items: viewModel.empresasNomes,
                          preset: FIDSelectBox.medium,
                          controller: viewModel.empresaController,
                          onChanged: (item) => {
                            print(item)
                          },
                          padding: {"bottom": 0.03}
                      )
                    ],
                  ),

                  FIDButton(text: "Criar", preset: FIDButton.medium, onPressed: () => {
                    viewModel.registro(context)
                  },),
                  FIDLine(preset: FIDLine.small),
                  FIDText(baseText: "Já tem uma conta? ",
                    linkText: "Entre",
                    route: Routes.loginPage,
                    preset: FIDText.link,
                    textAlign: TextAlign.center,),
                ],
              )
            ),
          ),
        );
      },
    );
  }
}
