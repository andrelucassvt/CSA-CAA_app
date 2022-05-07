import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/modules/home/coordinator/home_coordinator.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/home_body/mobile/paciente_interacoes_body.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/home_body/web/medico_comandos_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: kIsWeb ?  const MedicoComandosBody() : const PacienteInteracoesBody(),

      floatingActionButton: kIsWeb 
        ? FloatingActionButton(
          onPressed: () => HomeCoordinator.navegarParaCadastrarPaciente(context),
          child: const Icon(Icons.add),
        )
        : null
    );
  }
}
