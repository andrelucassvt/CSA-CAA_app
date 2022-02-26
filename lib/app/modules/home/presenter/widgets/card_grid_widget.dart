import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:projeto_csa_app/app/modules/home/domain/interface/dados_semelhantes_card_grid_interface.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/player_audio/player_audio_cubit.dart';

enum cardInterface {
  paciente,
  medico,
}

class CardGridWidget extends StatelessWidget {
  final DadosSemelhantesCardGridInterface dados;
  final cardInterface interface;

  CardGridWidget({
    Key? key,
    required this.dados,
    required this.interface,
  }) : super(key: key);

  var playerAudio = GetIt.I.get<PlayerAudioCubit>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (interface == cardInterface.paciente) {
          return await playerAudio.playerAudio('audios/teste.mp3');
        }
      },
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22)
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              width: .6
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(
                size: 40,
              ),
              const Spacer(),
              Text(
                dados.nomeCard,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
