import 'package:flutter/material.dart';

class MedicoPerfilPage extends StatefulWidget {
  const MedicoPerfilPage({ Key? key }) : super(key: key);

  @override
  _MedicoPerfilPageState createState() => _MedicoPerfilPageState();
}

class _MedicoPerfilPageState extends State<MedicoPerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Central'),
        centerTitle: true,
      ),
    );
  }
}