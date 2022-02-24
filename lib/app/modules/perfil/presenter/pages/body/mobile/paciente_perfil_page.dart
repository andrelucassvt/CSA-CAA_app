import 'package:flutter/material.dart';

class PacientePerfilPage extends StatefulWidget {
  const PacientePerfilPage({Key? key}) : super(key: key);

  @override
  _PacientePerfilPageState createState() => _PacientePerfilPageState();
}

class _PacientePerfilPageState extends State<PacientePerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
      ),
    );
  }
}
