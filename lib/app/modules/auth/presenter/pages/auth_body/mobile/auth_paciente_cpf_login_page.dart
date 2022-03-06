import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/cubit/login_cubit.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';
import 'package:projeto_csa_app/app/shared/widget/default_button.dart';

class AuthPacienteCpfPage extends StatefulWidget {
  const AuthPacienteCpfPage({Key? key}) : super(key: key);

  @override
  _AuthPacienteCpfPageState createState() => _AuthPacienteCpfPageState();
}

class _AuthPacienteCpfPageState extends State<AuthPacienteCpfPage> {
  TextEditingController textEditingController = TextEditingController();
  final controller = GetIt.I.get<LoginCubit>();
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
              Colors.blue
            ]
          )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocConsumer<LoginCubit, LoginState>(
              bloc: controller,
              listener: (context, state) {
                if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.red,
                    content:Text('Error ao fazer login. Tente novamente'),
                  ));
                  return;
                }
                if (state is LoginDataisEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Preencha todo o campo'),
                  ));
                  return;
                }
                if (state is LoginSucess) {
                  Navigator.of(context).pushReplacementNamed(RoutesApp.home);
                  return;
                }
              },
              builder: (context, state) {
                return Column(
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
                    TextFormField(
                      autofocus: false,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        hintText: 'Digite seu CPF',
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 22
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, 
                          vertical: 0.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: state is LoginFailure || state is LoginDataisEmpty ? Colors.red : Colors.green, 
                              width: 3.0
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey, 
                              width: 3.0
                            ),
                          ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DefaultButtonApp(
                      textButton: 'Avançar',
                      textColor: Colors.white,
                      width: double.infinity,
                      isLoading: state is LoginLoading,
                      actionButton: () => controller.loginPaciente(textEditingController.text),
                    ),
                    const Spacer()
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
