import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';

class AuthCoordinator {


  static Future<void> irParaTelaDeLogin(BuildContext context) async {
    await Navigator.pushReplacementNamed(context,RoutesApp.auth);
  }

  static Future<void> irParaHomePage(BuildContext context) async {
    await Navigator.pushReplacementNamed(context,RoutesApp.home);
  }

}