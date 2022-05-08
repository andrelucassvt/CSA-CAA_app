import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/pages/login_page.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/pages/splash_page.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/home_page.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/mobile/frases_personalizadas_page.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/web/cadastrar_paciente_web_page.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/web/details_paciente_web_page.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/web/escolher_interacoes_web_page.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/components/ajuda_page.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/pages/perfil_page.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
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
        RoutesApp.inicial: (BuildContext context) => kIsWeb ? const LoginPage() : const SplashPage(),
        RoutesApp.auth: (BuildContext context) => const LoginPage(),
        RoutesApp.home: (BuildContext context) => const HomePage(),
        RoutesApp.homeFrasesPersonalizadas: (BuildContext context) => const FrasesPersonalizadasPage(),
        RoutesApp.homeDetalhesPaciente: (BuildContext context) => const DetailsPacienteWebPage(),
        RoutesApp.homePerfil: (BuildContext context) => const PerfilPage(),
        RoutesApp.homePerfilAjuda: (BuildContext context) => const AjudaPage(),
        RoutesApp.homeCadastrarPaciente: (BuildContext context) => const CadastrarPacienteWebPage(),
        RoutesApp.homeEscolherInteracoes: (BuildContext context) => const EscolherInteracoesWebPage()
      },
    );
  }
}
