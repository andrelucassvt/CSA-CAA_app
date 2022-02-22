import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/home_page.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/pages/paciente_perfil_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/': (BuildContext context) => const HomePage(),
        '/perfilPaciente': (BuildContext context) => const PacientePerfilPage(),
      },
    );
  }
}
