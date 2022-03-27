import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';
import 'package:projeto_csa_app/app/shared/util/snackbar_common/snackbar_common.dart';
import 'package:projeto_csa_app/app/shared/widget/default_button.dart';

enum SexoDoPaciente { masculino, feminino }

class CadastrarPacienteWebPage extends StatefulWidget {
  const CadastrarPacienteWebPage({ Key? key }) : super(key: key);

  @override
  State<CadastrarPacienteWebPage> createState() => _CadastrarPacienteWebPageState();
}

class _CadastrarPacienteWebPageState extends State<CadastrarPacienteWebPage> {
  SexoDoPaciente? _character = SexoDoPaciente.masculino;
  TextEditingController nomePaciente = TextEditingController();
  TextEditingController nomeResponsavel = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController cpf = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de paciente'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20
        ),
        child: Column(
          children: [
            
            Row(
              children: [
                SizedBox(
                  width: 500,
                  child: TextFormField(
                    controller: nomePaciente,
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
                    controller: nomeResponsavel,
                    decoration: const InputDecoration(
                      labelText: 'Nome do responsável',
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
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 500,
                  child: TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                      labelText: 'E-mail para contato',
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
                    controller: telefone,
                    decoration: const InputDecoration(
                      labelText: 'Telefone para contato',
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
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 500,
                  child: TextFormField(
                    controller: cpf,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'CPF do paciente',
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Gênero:'),
                    Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: ListTile(
                            title: const Text('Masculino'),
                            leading: Radio<SexoDoPaciente>(
                              value: SexoDoPaciente.masculino,
                              groupValue: _character,
                              onChanged: (SexoDoPaciente? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: ListTile(
                            title: const Text('Feminino'),
                            leading: Radio<SexoDoPaciente>(
                              value: SexoDoPaciente.feminino,
                              groupValue: _character,
                              onChanged: (SexoDoPaciente? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            DefaultButtonApp(
              textButton: 'Avançar',
              textColor: Colors.white, 
              actionButton: () {
                if (cpf.text.isNotEmpty && nomePaciente.text.isNotEmpty && nomeResponsavel.text.isNotEmpty && email.text.isNotEmpty && telefone.text.isNotEmpty) {
                  Navigator.pushNamed(
                    context, 
                    RoutesApp.homeEscolherInteracoes,
                    arguments: PacienteEntity(
                      sexo: _character == SexoDoPaciente.masculino ? 'Masculino' : 'Feminino',
                      cpf: cpf.text.replaceAll(RegExp(r'[.-]'), ""),
                      nome: nomePaciente.text,
                      responsavel: nomeResponsavel.text,
                      idInteracoes: []
                    )
                  );
                } else {
                  SnackbarCommon.chamarSnackBarWeb(
                    text: 'Preencha todos os campos',
                    backgroundColor: Colors.red, 
                    context: context,
                  );
                }
              }
            )
          ],
        ),
      ),
    );
  }
}