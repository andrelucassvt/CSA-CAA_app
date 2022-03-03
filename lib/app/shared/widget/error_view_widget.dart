import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/shared/widget/default_button.dart';

class ErrorViewWidget extends StatelessWidget {
  final String errorMessage;
  final Function() actionButton;
  const ErrorViewWidget({
    Key? key,
    required this.errorMessage,
    required this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage),
          const SizedBox(
            height: 15,
          ),
          DefaultButtonApp(
            textButton: 'Recarregar', 
            actionButton: () async => actionButton
          ),
        ],
      ),
    );
  }
}
