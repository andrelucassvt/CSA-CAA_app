import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/web/util/routes/named_routes_web.dart';

class AuthWebCoordinator {
  
  static Future<void> irParaHomePage(BuildContext context) async {
    await Navigator.pushNamed(context, NamedRoutesWeb.home);
  }
}