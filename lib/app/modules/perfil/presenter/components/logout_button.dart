import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog(
        context: context, 
        builder: (context) => SimpleDialog(
          title: const Text('Atenção'),
          titlePadding: const EdgeInsets.only(
            left: 20,
            top: 20,
          ),
          contentPadding: const EdgeInsets.only(
            left: 20,
            top: 10
          ),
          children: [
            const Text('Deseja finalizar sua sessão ?'),
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
                    onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(RoutesApp.inicial, (Route<dynamic> route) => false), 
                    child: const Text(
                      'Sim',
                      style: TextStyle(
                        color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
      child: const Text(
        'Finalizar sessão',
        style: TextStyle(
          color: Colors.red
        ),
      )
    );
  }
}