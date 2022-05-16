import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_csa_app/app/common/database/manager_keys_impl.dart';
import 'package:projeto_csa_app/app/mobile/util/routes/named_routes_mobile.dart';
import 'package:projeto_csa_app/app/web/util/routes/named_routes_web.dart';

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
                    onPressed: () {
                      Navigator.of(context)
                        .pushNamedAndRemoveUntil(
                          kIsWeb ? NamedRoutesWeb.inicial : NamedRoutesMobile.inicial,
                          (Route<dynamic> route) => false,
                        );
                        ManagerKeysImpl()
                          ..saveToken("")
                          ..saveInfoUser("");
                    }, 
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