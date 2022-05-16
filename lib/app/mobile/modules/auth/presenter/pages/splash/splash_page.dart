import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/common/images/images_app.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/coordinator/auth_mobile_coordinator.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/presenter/pages/splash/cubit/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = GetIt.I.get<SplashCubit>();
  @override
  void initState() {
    super.initState();
    controller.validarAcesso();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      bloc: controller,
      listener: (context, state) {
        if (state is SplashTelaDeLogin) {
          AuthMobileCoordinator.irParaTelaDeLogin(context);
        } else if (state is SplashTelaDeHome){
          AuthMobileCoordinator.irParaHomePage(context);
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
                  child: Image.asset(ImagesApp.logo),
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
