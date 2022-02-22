import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/widgets/card_paciente_visao_medico_widget.dart';

class MedicoComandosBody extends StatefulWidget {
  const MedicoComandosBody({ Key? key }) : super(key: key);

  @override
  _MedicoComandosBodyState createState() => _MedicoComandosBodyState();
}

class _MedicoComandosBodyState extends State<MedicoComandosBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 5,
          crossAxisSpacing: 13,
          children: const [
            CardPacienteVisaoMedicoWidget(),
            CardPacienteVisaoMedicoWidget(),
            CardPacienteVisaoMedicoWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}