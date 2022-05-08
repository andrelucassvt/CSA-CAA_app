import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/modules/home/coordinator/home_coordinator.dart';

class CardGridFrasesPersonalizadas extends StatelessWidget {
  const CardGridFrasesPersonalizadas({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => HomeCoordinator.navegarParaFrasesPersonalizadas(context),
      child: Card(
        color: Colors.yellow,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22)
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              width: .6
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 40,
                child: Icon(Icons.star, size: 40, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Frases Personalizadas',
                textAlign: TextAlign.center,
                style: TextStyle(
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