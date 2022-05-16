import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/images/images_app.dart';
import 'package:projeto_csa_app/app/common/widget/error_view_widget.dart';
import 'package:projeto_csa_app/app/common/widget/info_user_title_subtitle.dart';
import 'package:projeto_csa_app/app/common/widget/logout_button.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/coordinator/perfil_mobile_coordinator.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/presenter/pages/cubit/perfil_mobile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PerfilMobilePage extends StatefulWidget {
  const PerfilMobilePage({ Key? key }) : super(key: key);

  @override
  State<PerfilMobilePage> createState() => _PerfilMobilePageState();
}

class _PerfilMobilePageState extends State<PerfilMobilePage> {

  final controller = GetIt.I.get<PerfilMobileCubit>();

  @override
  void initState() {
    super.initState();
    controller.getPerfil();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: BlocBuilder<PerfilMobileCubit, PerfilMobileState>(
            bloc: controller,
            builder: (context, state) {
              if (state is PerfilMobileLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PerfilMobileFailure) {
                return ErrorViewWidget(
                  errorMessage: state.failure.errorMessage, 
                  actionButton: () async => controller.getPerfil()
                );
              }
              if (state is PerfilMobileSucess) {
                PacienteEntity dados = state.pacienteEntity;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
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
                      InfoUserTitleSubTitleWidget(
                        title: 'Nome:',
                        subtitle: dados.nome ?? 'Sem informação',
                      ),
                      InfoUserTitleSubTitleWidget(
                        title: 'Responsável:',
                        subtitle: dados.responsavel ?? 'Sem informação',
                      ),
                      InfoUserTitleSubTitleWidget(
                        title: 'E-mail do Médico:',
                        subtitle: dados.medico ?? 'Sem informação',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.bottomRight, 
                        child: LogoutButton()
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () => PerfilMobileCoordinator.navegarParaTelaDeAjuda(context),
                          child: const Text('Precisa de ajuda ?')
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}