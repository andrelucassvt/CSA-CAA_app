import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/common/widget/ajuda_page.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/presenter/pages/login/login_mobile_page.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/presenter/pages/splash/splash_page.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/presenter/pages/frases_personalizadas/frases_personalizadas_mobile.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/presenter/pages/home/home_mobile_page.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/presenter/pages/perfil_mobile_page.dart';

class NamedRoutesMobile {
  static const inicial = '/';
  static const login = '/auth';
  static const home = '/home';
  static const homeFrasesPersonalizadas = '/home/frases-personalizadas';
  static const homePerfil = '/home/perfil';
  static const homePerfilAjuda = '/home/perfil/ajuda';


  static final routesMobile = <String, WidgetBuilder>{
    inicial: (BuildContext context) => const SplashPage(),
    login: (BuildContext context) => const LoginMobilePage(),
    home: (BuildContext context) => const HomeMobilePage(),
    homeFrasesPersonalizadas: (BuildContext context) => const FrasesPersonalizadasMobilePage(),
    homePerfil: (BuildContext context) => const PerfilMobilePage(),
    homePerfilAjuda: (BuildContext context) => const AjudaPage(),
  };
}