import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projeto_csa_app/app/common/audio_player/player_text_to_voice.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/strings_app.dart';
import 'package:projeto_csa_app/app/common/widget/card_grid_widget.dart';

class ListarFrasesPersonalizadasPage extends StatefulWidget {
  const ListarFrasesPersonalizadasPage({Key? key}) : super(key: key);

  @override
  State<ListarFrasesPersonalizadasPage> createState() => _ListarFrasesPersonalizadasPageState();
}

class _ListarFrasesPersonalizadasPageState extends State<ListarFrasesPersonalizadasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frases Personalizadas'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<InteracaoEntity>(nametable).listenable(),
        builder: (context, Box<InteracaoEntity> box, _) {
          final List<InteracaoEntity> lista = box.values.toList();
          return GridView.builder(
              itemCount: lista.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 190,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 20
              ),
              itemBuilder: (context, index) {
                return CardGridWidget(
                  dados: lista[index],
                  actionCard: () async => await PlayerTextToVoice.playerAudio(lista[index].nome!),
                );
              }
          );
        },
      ),
    );
  }
}
