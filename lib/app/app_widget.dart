import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/pages/auth_page.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/home_page.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/pages/perfil_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        minWidth: 370,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(370, name: MOBILE),
        ],
      ),
      routes: {
        '/': (BuildContext context) => const AuthPage(),
        '/home': (BuildContext context) => const HomePage(),
        '/perfil': (BuildContext context) => const PerfilPage(),
      },
    );
  }
}
