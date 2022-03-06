import 'package:flutter/material.dart';

class EscolherInteracoesWebPage extends StatefulWidget {
  const EscolherInteracoesWebPage({ Key? key }) : super(key: key);

  @override
  State<EscolherInteracoesWebPage> createState() => _EscolherInteracoesWebPageState();
}

class _EscolherInteracoesWebPageState extends State<EscolherInteracoesWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolher interações do cliente'),
      ),
    );
  }
}