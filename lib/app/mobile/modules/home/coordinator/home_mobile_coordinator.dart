import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/mobile/util/routes/named_routes_mobile.dart';

class HomeMobileCoordinator {

  static Future<void> navegarParaFrasesPersonalizadas(BuildContext context) async {
    await Navigator.of(context).pushNamed(NamedRoutesMobile.homeFrasesPersonalizadas);
  }

  static Future<void> navegarParaPerfil(BuildContext context) async {
    await Navigator.of(context).pushNamed(NamedRoutesMobile.homePerfil);
  }
}