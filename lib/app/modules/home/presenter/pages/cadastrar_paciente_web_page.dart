import 'package:flutter/material.dart';

class CadastrarPacienteWebPage extends StatefulWidget {
  const CadastrarPacienteWebPage({ Key? key }) : super(key: key);

  @override
  State<CadastrarPacienteWebPage> createState() => _CadastrarPacienteWebPageState();
}

class _CadastrarPacienteWebPageState extends State<CadastrarPacienteWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de paciente'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}