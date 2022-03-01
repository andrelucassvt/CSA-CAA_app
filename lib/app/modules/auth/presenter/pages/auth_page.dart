import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/pages/auth_body/mobile/auth_paciente_cpf_login_page.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/pages/auth_body/web/auth_medico_login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({ Key? key }) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const AuthMedicoLoginPage() : const AuthPacienteCpfPage();
  }
}