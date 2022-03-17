import 'dart:ui';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/blocs/login/login_cubit.dart';
import 'package:projeto_csa_app/app/shared/error/common_errors.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';
import 'package:projeto_csa_app/app/shared/util/snackbar_common/snackbar_common.dart';
import 'package:projeto_csa_app/app/shared/widget/default_button.dart';

class AuthMedicoLoginPage extends StatefulWidget {
  const AuthMedicoLoginPage({Key? key}) : super(key: key);

  @override
  _AuthMedicoLoginPageState createState() => _AuthMedicoLoginPageState();
}

class _AuthMedicoLoginPageState extends State<AuthMedicoLoginPage> {
  TextEditingController textEmail = TextEditingController();
  TextEditingController textSenha = TextEditingController();
  bool showObscureText = true;
  final controller = GetIt.I.get<LoginCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 860) {
          return Center(
            child: _build(),
          );
        }
        return Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                color: Colors.blue,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/autismo.jpg')
                  )
                ),
              ),
            ),
            _build()
          ],
        );
      }),
    );
  }

  Widget _build() {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: controller,
      listener: (context, state) {
        if (state is LoginFailure) {
          if (state.error is CommonNoDataFoundError) {
            SnackbarCommon.chamarSnackBarWeb(text: 'Usuário não está cadastrado', context: context);
            return;
          }
          SnackbarCommon.chamarSnackBarWeb(text: state.error.errorMessage, context: context);
        } else if (state is LoginDataisEmpty){
          SnackbarCommon.chamarSnackBarWeb(text: 'Preencha todos os campos', context: context);
        } else if (state is LoginSucess) {
          Navigator.of(context).pushReplacementNamed(RoutesApp.home);
        }
      },
      builder: (context, state) {
        return Container(
          width: 500,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              const Spacer(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Informe seu cadastro:',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: TextFormField(
                  controller: textEmail,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: 'CPF',
                    hintStyle: TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10, 
                      vertical: 0.0,
                    )
                  ),
                )
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: TextFormField(
                  controller: textSenha,
                  obscureText: showObscureText,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    hintStyle: const TextStyle(color: Colors.black),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          if (showObscureText) {
                            showObscureText = false;
                          } else {
                            showObscureText = true;
                          }
                        });
                      },
                      icon: Icon(showObscureText ? Icons.visibility_off : Icons.visibility)
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10, 
                      vertical: 0.0,
                    )
                  ),
                )
              ),
              const SizedBox(
                height: 30,
              ),
              DefaultButtonApp(
                textButton: 'Avançar',
                textColor: Colors.white,
                backgroundColor: Colors.blue,
                isLoading: state is LoginLoading,
                width: double.infinity,
                actionButton: () => controller.loginMedico(
                  email: textEmail.text.replaceAll(RegExp(r'[.-]'), ""), 
                  senha: textSenha.text,
                )
              ),
              const Spacer()
            ],
          ),
        );
      },
    );
  }
}
