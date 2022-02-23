import 'package:flutter/material.dart';

class CardPacienteVisaoMedicoWidget extends StatelessWidget {
  const CardPacienteVisaoMedicoWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FlutterLogo(),
            Text('aaa')
          ],
        ),
      ),
    );
  }
}