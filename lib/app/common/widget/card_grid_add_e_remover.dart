import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';



class CardGridAddeRemoverWidget extends StatelessWidget {
  final InteracaoEntity interacao;
  final VoidCallback actionButton;
  const CardGridAddeRemoverWidget({
    Key? key,
    required this.interacao,
    required this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(
            minWidth: 400
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              width: 2,
              color: interacao.isSelect ? Colors.green : Colors.blue
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                child: Image.network(interacao.foto!),
              ),
              const Spacer(),
              Text(
                interacao.nome ?? "Nome",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
          onTap: actionButton,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: interacao.isSelect? Colors.green : Colors.blue,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Text(
                interacao.isSelect ?  'Remover' : 'Adicionar',
                style: const TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
