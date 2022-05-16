import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/mobile/util/routes/named_routes_mobile.dart';

class PerfilMobileCoordinator {
  
  static Future<void> navegarParaTelaDeAjuda(BuildContext context) async {
    await Navigator.pushNamed(context, NamedRoutesMobile.homePerfilAjuda);
  }
}