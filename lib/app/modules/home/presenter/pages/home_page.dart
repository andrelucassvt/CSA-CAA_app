import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/home_interacoes/home_interacoes_cubit.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/cadastrar_paciente_web_page.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/home_body/mobile/paciente_interacoes_body.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/pages/home_body/web/medico_comandos_body.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';

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
      appBar: AppBar(
        title: Text(kIsWeb ? 'Pacientes' :'Interações'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, RoutesApp.homePerfil), 
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: kIsWeb ?  const MedicoComandosBody() : const PacienteInteracoesBody(),

      floatingActionButton: kIsWeb 
        ? FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, RoutesApp.homeCadastrarPaciente),
          child: const Icon(Icons.add),
        )
        : null
    );
  }
}
