import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/auth/presenter/blocs/validar_acesso/validar_acesso_cubit.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';

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
          Navigator.pushReplacementNamed(context, RoutesApp.auth);
        } else if (state is ValidarAcessoHome){
          Navigator.pushReplacementNamed(context, RoutesApp.home);
        }
      },
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              SizedBox(
                height: 200,
              ),
              CircularProgressIndicator()
            ],
          ),
        );
      },
    );
  }
}
