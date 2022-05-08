import 'package:flutter/material.dart';

class FrasesPersonalizadasPage extends StatefulWidget {
  const FrasesPersonalizadasPage({ Key? key }) : super(key: key);

  @override
  State<FrasesPersonalizadasPage> createState() => _FrasesPersonalizadasPageState();
}

class _FrasesPersonalizadasPageState extends State<FrasesPersonalizadasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frases Personalizadas'),
        centerTitle: true,
      ),
    );
  }
}