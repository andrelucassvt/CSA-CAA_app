import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/app_widget.dart';
import 'package:projeto_csa_app/app/mobile/util/routes/named_routes_mobile.dart';

class AuthMobileCoordinator {
  
  static Future<void> irParaTelaDeLogin(BuildContext context) async {
    await Navigator.pushReplacementNamed(context,NamedRoutesMobile.login);
  }

  static Future<void> irParaHomePage(BuildContext context) async {
    await Navigator.pushReplacementNamed(context,NamedRoutesMobile.home);
  }
}