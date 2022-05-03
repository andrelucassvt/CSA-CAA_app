import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';

class PerfilCoordinator {
  
  static Future<void> navegarParaTelaDeAjuda(BuildContext context) async {
    await Navigator.pushNamed(context,RoutesApp.homePerfilAjuda);
  }
  
}