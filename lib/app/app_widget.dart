import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/pages/auth_page.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/cadastrar_paciente_web_page.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/details_paciente_web_page.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/escolher_interacoes_web_page.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/home_page.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/pages/perfil_page.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
        ),
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        minWidth: 370,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(370, name: MOBILE),
        ],
      ),
      routes: {
        RoutesApp.inicial: (BuildContext context) => const AuthPage(),
        RoutesApp.home: (BuildContext context) => const HomePage(),
        RoutesApp.homeDetalhesPaciente: (BuildContext context) => const DetailsPacienteWebPage(),
        RoutesApp.homePerfil: (BuildContext context) => const PerfilPage(),
        RoutesApp.homeCadastrarPaciente: (BuildContext context) => const CadastrarPacienteWebPage(),
        RoutesApp.homeEscolherInteracoes: (BuildContext context) => const EscolherInteracoesWebPage()
      },
    );
  }
}
