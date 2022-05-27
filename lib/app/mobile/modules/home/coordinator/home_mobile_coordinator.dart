import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/mobile/util/routes/named_routes_mobile.dart';

class HomeMobileCoordinator {

  static Future<void> navegarParaFrasesPersonalizadas(BuildContext context) async {
    showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            title: const Text("Frases Personalizadas"),
            content: const Text("Você deseja navegar para a página de frases personalizadas?"),
            actions: <Widget>[
              FlatButton(
                child: const Text(
                    "Não", style: TextStyle(color: Colors.red)
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: const Text(
                    "Sim", style: TextStyle(color: Colors.green)
                ),
                onPressed: () async {
                  await Navigator.of(context).pushNamed(NamedRoutesMobile.homeFrasesPersonalizadas);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }

  static Future<void> navegarParaPerfil(BuildContext context) async {
    await Navigator.of(context).pushNamed(NamedRoutesMobile.homePerfil);
  }

  static Future<void> navegarParaListagemDeFrasesPersonalizadas(BuildContext context) async {
    await Navigator.of(context).pushNamed(NamedRoutesMobile.homeListagemDeFrasesPersonalizadas);
  }
}