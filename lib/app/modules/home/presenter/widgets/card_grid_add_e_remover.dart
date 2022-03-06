import 'package:flutter/material.dart';

import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';

class CardGridAddeRemoverWidget extends StatelessWidget {
  final InteracaoEntity interacao;
  const CardGridAddeRemoverWidget({
    Key? key,
    required this.interacao,
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
              color: Colors.red
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
                interacao.nome ?? "Nome",
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
          onTap: () => showDialog(
            context: context, 
            builder: (context) => SimpleDialog(
              title: const Text(
                'Atenção',
                style: TextStyle(
                  color: Colors.red
                ),
              ),
              titlePadding: const EdgeInsets.only(
                left: 20,
                top: 20,
              ),
              contentPadding: const EdgeInsets.only(
                left: 20,
                top: 10
              ),
              children: [
                const Text('Deseja remover essa interação da lista do paciente ?'),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(), 
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {}, 
                        child: const Text(
                          'Sim',
                          style: TextStyle(
                            color: Colors.red
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          ),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30)
              ),
              child: const Text(
                'Remover',
                style: TextStyle(
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
