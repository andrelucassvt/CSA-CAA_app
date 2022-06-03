import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/common/images/images_app.dart';
import 'package:projeto_csa_app/app/common/widget/error_view_widget.dart';
import 'package:projeto_csa_app/app/common/widget/info_user_title_subtitle.dart';
import 'package:projeto_csa_app/app/common/widget/logout_button.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/presenter/pages/perfil/cubit/perfil_web_cubit.dart';

class PerfilWebPage extends StatefulWidget {
  const PerfilWebPage({Key? key}) : super(key: key);

  @override
  State<PerfilWebPage> createState() => _PerfilWebPageState();
}

class _PerfilWebPageState extends State<PerfilWebPage> {

  final controller = GetIt.I.get<PerfilWebCubit>();

  @override
  void initState() {
    super.initState();
    controller.getPerfil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Central',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0.0,
      ),
      body: BlocBuilder<PerfilWebCubit, PerfilWebState>(
        bloc: controller,
        builder: (context, state) {
          if (state is PerfilWebLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PerfilWebFailure) {
            return ErrorViewWidget(
                errorMessage: state.failure.errorMessage,
                actionButton: () async => controller.getPerfil()
            );
          }
          if (state is PerfilWebLoaded) {
            var dados = state.medicoEntity;
            return Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 150,
                    child: Image.asset(ImagesApp.logo),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InfoUserTitleSubTitleWidget(
                  title: 'Nome:',
                  subtitle: dados.nome ?? 'Sem informação',
                  //crossAxisAlignment: CrossAxisAlignment.center,
                ),
                InfoUserTitleSubTitleWidget(
                  title: 'Afiliação:',
                  subtitle: dados.afiliacao ?? 'Sem informação',
                  //crossAxisAlignment: CrossAxisAlignment.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                const LogoutButton()
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
