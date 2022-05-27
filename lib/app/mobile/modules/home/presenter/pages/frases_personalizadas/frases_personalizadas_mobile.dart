import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/strings_app.dart';
import 'package:projeto_csa_app/app/common/widget/text_field_common.dart';
import 'package:projeto_csa_app/app/mobile/util/snackbar/snackbar_mobile.dart';

class FrasesPersonalizadasMobilePage extends StatefulWidget {
  const FrasesPersonalizadasMobilePage({ Key? key }) : super(key: key);

  @override
  State<FrasesPersonalizadasMobilePage> createState() => _FrasesPersonalizadasMobilePageState();
}

class _FrasesPersonalizadasMobilePageState extends State<FrasesPersonalizadasMobilePage> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  Future<void> _salvarFrase(String frase) async {
    if (frase.isNotEmpty) {
      Box<InteracaoEntity> boxInteracao = Hive.box<InteracaoEntity>(nametable);
      boxInteracao.add(InteracaoEntity(
          nome: frase,
          foto: ''
      ));
      textController.clear();
      Navigator.of(context).pop();
    } else {
      SnackBarMobile.chamarSnackBar(
          text: 'Frase não pode ser vazia',
          context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frases Personalizadas'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _salvarFrase(textController.text),
          label: const Text('Salvar'),
          icon: const Icon(Icons.save),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFieldCommon(
                label: 'Frase Personalizada',
                controller: textController,
            ),
          )
        ],
      ),
    );
  }
}