import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/common/interface/dados_semelhantes_card_grid_interface.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/presenter/widgets/card_grid_frases_personalizadas.dart';

class CardGridWidget extends StatelessWidget {
  final DadosSemelhantesCardGridInterface dados;
  final Function() actionCard;

  const CardGridWidget({
    Key? key,
    required this.dados,
    required this.actionCard,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    if (dados.nomeCard == 'Frases Personalizadas'){
      return const CardGridFrasesPersonalizadas();
    }
    return InkWell(
      onTap: actionCard,
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
              SizedBox(
                height: 40,
                child: dados.fotoCard != ''
                   ? Image.network(dados.fotoCard)
                   : const Icon(Icons.person_outline, size: 40, color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                dados.nomeCard,
                textAlign: TextAlign.center,
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
