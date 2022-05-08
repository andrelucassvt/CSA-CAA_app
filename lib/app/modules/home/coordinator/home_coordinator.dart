import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';

class HomeCoordinator {

  static Future<void> navegarParaCadastrarPaciente(BuildContext context) async {
    await Navigator.of(context).pushNamed(RoutesApp.homeCadastrarPaciente);
  }

  static Future<void> navegarParaFrasesPersonalizadas(BuildContext context) async {
    await Navigator.of(context).pushNamed(RoutesApp.homeFrasesPersonalizadas);
  }

  static Future<void> navegarParaPerfil(BuildContext context) async {
    await Navigator.of(context).pushNamed(RoutesApp.homePerfil);
  }

  static Future<void> navegarParaDetalhesPaciente({
    required BuildContext context,
    required PacienteEntity pacienteEntity,
    }) async {
    await Navigator.of(context).pushNamed(
      RoutesApp.homeDetalhesPaciente,
      arguments: pacienteEntity,
    );
  }

  static Future<void> navegarParaEscolherInteracoes({
    required BuildContext context,
    required PacienteEntity pacienteEntity,
  }) async {
    await Navigator.of(context).pushNamed(
      RoutesApp.homeEscolherInteracoes,
      arguments: pacienteEntity,
    );
  }

}