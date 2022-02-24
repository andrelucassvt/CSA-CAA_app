import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthPacienteCpfPage extends StatefulWidget {
  const AuthPacienteCpfPage({ Key? key }) : super(key: key);

  @override
  _AuthPacienteCpfPageState createState() => _AuthPacienteCpfPageState();
}

class _AuthPacienteCpfPageState extends State<AuthPacienteCpfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.centerLeft,
            colors: [
              Colors.white,
              Colors.blue,
            ]
          )
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              const Center(
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CepInputFormatter(),
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Digite seu cpf',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 0.0
                            )
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          )
                        ),
                        child: const Icon(Icons.send),
                      )
                    ],
                  )
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}