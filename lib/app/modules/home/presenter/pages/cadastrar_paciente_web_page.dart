import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/components/text_field_common.dart';
import 'package:projeto_csa_app/app/shared/common/snackbar_common/snackbar_common.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';
import 'package:projeto_csa_app/app/shared/widget/default_button.dart';

enum SexoDoPaciente { masculino, feminino }


class CadastrarPacienteWebPage extends StatefulWidget {
  const CadastrarPacienteWebPage({ Key? key }) : super(key: key);

  @override
  State<CadastrarPacienteWebPage> createState() => _CadastrarPacienteWebPageState();
}

class _CadastrarPacienteWebPageState extends State<CadastrarPacienteWebPage> {
  SexoDoPaciente? _character = SexoDoPaciente.masculino;
  int fasesDoPaciente = 1;
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
                TextFieldCommon(
                  label: 'Nome do paciente', 
                  controller: nomePaciente,
                ),
                const SizedBox(
                  width: 100,
                ),
                TextFieldCommon(
                  label: 'Nome do responsável', 
                  controller: nomeResponsavel,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                TextFieldCommon(
                  label: 'E-mail para contato', 
                  controller: email,
                ),
                const SizedBox(
                  width: 100,
                ),
                TextFieldCommon(
                  label: 'Telefone para contato', 
                  controller: telefone,
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
                generoDoPaciente(),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            fasesDoPacienteWidget(),
            const SizedBox(
              height: 50,
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
                      fase: 'fase$fasesDoPaciente',
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

  Widget generoDoPaciente(){
    return Column(
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
    );
  }
  Widget fasesDoPacienteWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Fase do paciente:'),
        Wrap(
          children: [
            SizedBox(
              width: 200,
              child: ListTile(
                title: const Text('Fase: 1'),
                leading: Radio<int>(
                  value: 1,
                  groupValue: fasesDoPaciente,
                  onChanged: (value) {
                    setState(() {
                      fasesDoPaciente = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ListTile(
                title: const Text('Fase: 2'),
                leading: Radio<int>(
                  value: 2,
                  groupValue: fasesDoPaciente,
                  onChanged: (value) {
                    setState(() {
                      fasesDoPaciente = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ListTile(
                title: const Text('Fase: 3'),
                leading: Radio<int>(
                  value: 3,
                  groupValue: fasesDoPaciente,
                  onChanged: (value) {
                    setState(() {
                      fasesDoPaciente = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ListTile(
                title: const Text('Fase: 4'),
                leading: Radio<int>(
                  value: 4,
                  groupValue: fasesDoPaciente,
                  onChanged: (value) {
                    setState(() {
                      fasesDoPaciente = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ListTile(
                title: const Text('Fase: 5'),
                leading: Radio<int>(
                  value: 5,
                  groupValue: fasesDoPaciente,
                  onChanged: (value) {
                    setState(() {
                      fasesDoPaciente = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ListTile(
                title: const Text('Fase: 6'),
                leading: Radio<int>(
                  value: 6,
                  groupValue: fasesDoPaciente,
                  onChanged: (value) {
                    setState(() {
                      fasesDoPaciente = value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}