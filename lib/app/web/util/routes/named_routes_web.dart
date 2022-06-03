import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/web/modules/auth/presenter/pages/login/login_web_page.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/cadastrar_paciente/cadastrar_paciente_page.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/detalhes_paciente/detalhes_paciente_page.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/escolher_interacoes/escolher_interacoes_page.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/home/home_web_page.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/presenter/pages/perfil/perfil_web_page.dart';

class NamedRoutesWeb {
  static const String inicial = '/';
  static const String home = '/home';
  static const String cadastrarPaciente = '/home/cadastrarPaciente';
  static const String detalhesPaciente = '/home/detalhesPaciente';
  static const String escolherInteracoes = '/home/escolherInteracoes';
  static const String perfil = '/home/perfil';


  static final routesWeb = <String, WidgetBuilder>{
    inicial: (BuildContext context) => const LoginWebPage(),
    home: (BuildContext context) => const HomeWebPage(),
    cadastrarPaciente: (BuildContext context) => const CadastrarPacienteWebPage(),
    detalhesPaciente: (BuildContext context) => const DetalhesPacienteWebPage(),
    escolherInteracoes: (BuildContext context) => const EscolherInteracoesWebPage(),
    perfil: (BuildContext context) => const PerfilWebPage(),
  };
}