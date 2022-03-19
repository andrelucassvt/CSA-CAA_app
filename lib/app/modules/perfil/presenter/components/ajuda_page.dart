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
              'Ao clicar em alguns dos botões você será direcionado ao número de contato de ajuda oferecido pelo serviço',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ),
          DefaultButtonApp(
            textButton: 'APAE Brasil',
            textColor: Colors.blue,
            backgroundColor: Colors.yellow, 
            actionButton: () => _makePhoneCall('(061) 3224-9922'),
          ),
          const SizedBox(
            height: 20,
          ),
          DefaultButtonApp(
            textButton: 'Contato da clínica',
            textColor: Colors.white, 
            actionButton: () => _makePhoneCall('(061) 3224-9922'),
          ),
        ],
      ),
    );
  }
}