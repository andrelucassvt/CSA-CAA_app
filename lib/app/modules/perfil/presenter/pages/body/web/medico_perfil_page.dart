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
        backgroundColor: Colors.transparent,
        title: const Text(
          'Central',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0.0,
      ),
    );
  }
}