import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/auth/coordinator/auth_coordinator.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/blocs/validar_acesso/validar_acesso_cubit.dart';
import 'package:projeto_csa_app/app/shared/util/core/logos_app.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = GetIt.I.get<ValidarAcessoCubit>();
  @override
  void initState() {
    super.initState();
    controller.validarAcesso();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidarAcessoCubit, ValidarAcessoState>(
      bloc: controller,
      listener: (context, state) {
        if (state is ValidarAcessoTelaDeLogin) {
          AuthCoordinator.irParaTelaDeLogin(context);
        } else if (state is ValidarAcessoHome){
         AuthCoordinator.irParaHomePage(context);
        }
      },
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 150,
                  child: Image.asset(LogosApp.logoApp),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              const CircularProgressIndicator()
            ],
          ),
        );
      },
    );
  }
}
