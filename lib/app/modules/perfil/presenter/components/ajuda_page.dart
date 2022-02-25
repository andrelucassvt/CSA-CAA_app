import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/shared/widget/default_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AjudaPage extends StatelessWidget {
  const AjudaPage({ Key? key }) : super(key: key);
  
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atenção'),
        centerTitle: true,
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(), 
            icon: const Icon(Icons.cancel)
          )
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 70,
              right: 10,
              left: 10
            ),
            child: Text(
              'Ao clicar em avançar, você será direcionado ao número de contato da APAE Brasil (Associação de Pais e Amigos dos Excepcionais)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ),
          DefaultButtonApp(
            textButton: 'Avançar',
            textColor: Colors.white, 
            actionButton: () => _makePhoneCall('(061) 3224-9922'),
          )
        ],
      ),
    );
  }
}