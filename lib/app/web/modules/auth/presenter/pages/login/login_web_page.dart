import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/common/images/images_app.dart';
import 'package:projeto_csa_app/app/common/widget/default_button.dart';
import 'package:projeto_csa_app/app/web/modules/auth/coordinator/auth_web_coordinator.dart';
import 'package:projeto_csa_app/app/web/modules/auth/presenter/pages/login/cubit/login_web_cubit.dart';
import 'package:projeto_csa_app/app/web/util/snackbar/snackbar_web.dart';

class LoginWebPage extends StatefulWidget {
  const LoginWebPage({ Key? key }) : super(key: key);

  @override
  State<LoginWebPage> createState() => _LoginWebPageState();
}

class _LoginWebPageState extends State<LoginWebPage> {
  TextEditingController textEmail = TextEditingController();
  TextEditingController textSenha = TextEditingController();
  bool showObscureText = true;
  final controller = GetIt.I.get<LoginWebCubit>();
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
    return BlocConsumer<LoginWebCubit, LoginWebState>(
      bloc: controller,
      listener: (context, state) {
        if (state is LoginWebFailure) {
          SnackBarWeb.chamarSnackBarWeb(text: state.error.errorMessage, context: context);
        } else if (state is LoginWebDataisEmpty){
          SnackBarWeb.chamarSnackBarWeb(text: 'Preencha todos os campos', context: context);
        } else if (state is LoginWebEmailInvalid){
          SnackBarWeb.chamarSnackBarWeb(text: 'Digite o email corretamente', context: context);
        } else if (state is LoginWebSucess) {
          AuthWebCoordinator.irParaHomePage(context);
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
              Center(
                child: SizedBox(
                  height: 200,
                  child: Image.asset(ImagesApp.logo),
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
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
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
                isLoading: state is LoginWebLoading,
                width: double.infinity,
                actionButton: () => controller.login(
                  email: textEmail.text, 
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