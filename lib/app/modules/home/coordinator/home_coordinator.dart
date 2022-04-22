import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';
import 'package:projeto_csa_app/app/shared/widget/default_button.dart';

class HomeCoordinator {

  static Future<void> navegarParaCadastrarPaciente(BuildContext context) async {
    await Navigator.of(context).pushNamed(RoutesApp.homeCadastrarPaciente);
  }

  static Future<void> navegarParaPerfil(BuildContext context) async {
    await Navigator.of(context).pushNamed(RoutesApp.homePerfil);
  }

  static Future<void> mostrarBottomSheetPrimeiroAcesso(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Bem vindo ao Talk to help, você está a um passo de começar a usar o aplicativo!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              DefaultButtonApp(
                textButton: 'Começar',
                actionButton: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    );
  }
}