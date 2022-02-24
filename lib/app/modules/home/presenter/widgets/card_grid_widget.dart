import 'package:flutter/material.dart';

import 'package:projeto_csa_app/app/modules/home/domain/interface/dados_semelhantes_card_grid_interface.dart';

enum cardInterface {
  paciente,
  medico,
}

class CardGridWidget extends StatelessWidget {
  final DadosSemelhantesCardGridInterface dados;
  final cardInterface interface;

  const CardGridWidget({
    Key? key,
    required this.dados,
    required this.interface,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
