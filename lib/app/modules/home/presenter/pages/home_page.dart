import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/home_body/mobile/paciente_comandos_body.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/home_body/web/medico_comandos_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kIsWeb ? 'Pacientes' :'Comandos'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/home/perfil'), 
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: kIsWeb ?  const MedicoComandosBody() : const PacienteComandosBody(),
    );
  }
}
