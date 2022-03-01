import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/pages/perfil_body/mobile/paciente_perfil_page.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/pages/perfil_body/web/medico_perfil_page.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({ Key? key }) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const MedicoPerfilPage() : const PacientePerfilPage();
  }
}