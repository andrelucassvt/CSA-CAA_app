import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/pages/login_body/mobile/login_paciente_page.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/pages/login_body/web/login_medico_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const LoginMedicoPage() : const LoginPacientePage();
  }
}