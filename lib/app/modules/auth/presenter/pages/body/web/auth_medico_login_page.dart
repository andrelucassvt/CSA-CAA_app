import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/cubit/login_cubit.dart';
import 'package:projeto_csa_app/app/shared/widget/default_button.dart';

class AuthMedicoLoginPage extends StatefulWidget {
  const AuthMedicoLoginPage({Key? key}) : super(key: key);

  @override
  _AuthMedicoLoginPageState createState() => _AuthMedicoLoginPageState();
}

class _AuthMedicoLoginPageState extends State<AuthMedicoLoginPage> {
  TextEditingController textEmail = TextEditingController();
  TextEditingController textSenha = TextEditingController();
  final controller = GetIt.I.get<LoginCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 920) {
          return Center(child: _build());
        }
        return Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content:Text('Error ao fazer login. Tente novamente'),
          ));
          return;
        }
        if (state is LoginDataisEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Preencha o campo do e-mail'),
          ));
          return;
        }
        if (state is LoginSucess) {
          Navigator.of(context).pushReplacementNamed('/home');
          return;
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: TextFormField(
                  controller: textEmail,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: 'Digite seu e-mail',
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
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
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Digite sua senha',
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
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
              DefaultButtonApp(
                textButton: 'Avançar',
                textColor: Colors.white,
                backgroundColor: Colors.blue,
                isLoading: state is LoginLoading,
                width: double.infinity,
                actionButton: () => controller.loginMedico(
                  email: textEmail.text, 
                  senha: textEmail.text,
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
