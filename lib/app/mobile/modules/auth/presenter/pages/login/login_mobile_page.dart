import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/common/images/images_app.dart';
import 'package:projeto_csa_app/app/common/widget/default_button.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/coordinator/auth_mobile_coordinator.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/presenter/pages/login/cubit/login_mobile_cubit.dart';
import 'package:projeto_csa_app/app/mobile/util/snackbar/snackbar_mobile.dart';

class LoginMobilePage extends StatefulWidget {
  const LoginMobilePage({ Key? key }) : super(key: key);

  @override
  State<LoginMobilePage> createState() => _LoginMobilePageState();
}

class _LoginMobilePageState extends State<LoginMobilePage> {
  TextEditingController cpfText = TextEditingController();
  final controller = GetIt.I.get<LoginMobileCubit>();
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
              Color.fromARGB(152, 25, 233, 126),
              Colors.blue,
            ]
          )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocConsumer<LoginMobileCubit, LoginMobileState>(
              bloc: controller,
              listener: (context, state) {
                if (state is LoginMobileFailure) {
                  SnackBarMobile.chamarSnackBar(
                    text: state.error.errorMessage, 
                    context: context
                  );
                } else if (state is LoginMobileDataisEmpty) {
                  SnackBarMobile.chamarSnackBar(
                    text: 'Preencha todo o campo', 
                    context: context
                  );
                } else if (state is LoginMobileSucess) {
                  AuthMobileCoordinator.irParaHomePage(context);
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
                        child: Image.asset(ImagesApp.logo),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Bem vindo ao Talk to help',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
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
                              color: state is LoginMobileFailure || state is LoginMobileDataisEmpty ? Colors.red : Colors.green, 
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
                      isLoading: state is LoginMobileLoading,
                      actionButton: () => controller.login(
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