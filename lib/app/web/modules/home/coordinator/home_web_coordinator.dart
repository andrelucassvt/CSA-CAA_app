import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/web/util/routes/named_routes_web.dart';

class HomeWebCoordinator {

  static Future<void> voltarParaHome(BuildContext context) async {
    await Navigator.pushNamed(context, NamedRoutesWeb.home);
  }

  static Future<void> navegarParaCadastrarPaciente(BuildContext context) async {
    await Navigator.of(context).pushNamed(NamedRoutesWeb.cadastrarPaciente);
  }

  static Future<void> navegarParaPerfil(BuildContext context) async {
    await Navigator.of(context).pushNamed(NamedRoutesWeb.perfil);
  }

  static Future<void> navegarParaDetalhesPaciente({
    required BuildContext context,
    required PacienteEntity pacienteEntity,
  }) async {
    await Navigator.of(context).pushNamed(
      NamedRoutesWeb.detalhesPaciente,
      arguments: pacienteEntity,
    );
  }

  static Future<void> navegarParaEscolherInteracoes({
    required BuildContext context,
    required PacienteEntity pacienteEntity,
  }) async {
    await Navigator.of(context).pushNamed(
      NamedRoutesWeb.escolherInteracoes,
      arguments: pacienteEntity,
    );
  }
}