import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/blocs/login/login_cubit.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';
import 'package:projeto_csa_app/app/shared/util/core/logos_app.dart';
import 'package:projeto_csa_app/app/shared/util/snackbar_common/snackbar_common.dart';
import 'package:projeto_csa_app/app/shared/widget/default_button.dart';

class AuthPacienteCpfPage extends StatefulWidget {
  const AuthPacienteCpfPage({Key? key}) : super(key: key);

  @override
  _AuthPacienteCpfPageState createState() => _AuthPacienteCpfPageState();
}

class _AuthPacienteCpfPageState extends State<AuthPacienteCpfPage> {
  TextEditingController cpfText = TextEditingController();
  final controller = GetIt.I.get<LoginCubit>();
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocConsumer<LoginCubit, LoginState>(
              bloc: controller,
              listener: (context, state) {
                if (state is LoginFailure) {
                  SnackbarCommon.chamarSnackBarMobile(
                    text: state.error.errorMessage, 
                    context: context
                  );
                } else if (state is LoginDataisEmpty) {
                  SnackbarCommon.chamarSnackBarMobile(
                    text: 'Preencha todo o campo', 
                    context: context
                  );
                } else if (state is LoginSucess) {
                  Navigator.of(context).pushReplacementNamed(RoutesApp.home);
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Center(
                      child: SizedBox(
                        height: 150,
                        child: Image.asset(LogosApp.logoApp),
                      ),
                    ),
                    const Spacer(),
                    TextFormField(
                      focusNode: controller.focusNode,
                      controller: cpfText,
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
                          vertical: 20.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: state is LoginFailure || state is LoginDataisEmpty ? Colors.red : Colors.green, 
                              width: 3.0
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
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
                      actionButton: () => controller.loginPaciente(
                        cpfText.text.replaceAll(RegExp(r'[.-]'), ""),
                      ),
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
