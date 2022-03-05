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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20
        ),
        child: Column(
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 500,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome do paciente',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue, 
                          width: 2.0
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey, 
                          width: 1.0
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
               SizedBox(
                  width: 500,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome do Responsavel',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue, 
                          width: 2.0
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey, 
                          width: 1.0
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}