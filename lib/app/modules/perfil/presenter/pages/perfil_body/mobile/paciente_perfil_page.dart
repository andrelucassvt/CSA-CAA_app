import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/blocs/perfil/perfil_cubit.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/components/ajuda_page.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/components/logout_button.dart';
import 'package:projeto_csa_app/app/shared/widget/default_button.dart';
import 'package:projeto_csa_app/app/shared/widget/error_view_widget.dart';
import 'package:projeto_csa_app/app/shared/widget/info_user_title_subtitle.dart';

class PacientePerfilPage extends StatefulWidget {
  const PacientePerfilPage({Key? key}) : super(key: key);

  @override
  _PacientePerfilPageState createState() => _PacientePerfilPageState();
}

class _PacientePerfilPageState extends State<PacientePerfilPage> {
  final controller = GetIt.I.get<PerfilCubit>();

  @override
  void initState() {
    super.initState();
    controller.getPerfilPaciente();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
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
          child: BlocBuilder<PerfilCubit, PerfilState>(
            bloc: controller,
            builder: (context, state) {
              if (state is PerfilLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PerfilFailure) {
                return ErrorViewWidget(
                  errorMessage: state.failure.errorMessage, 
                  actionButton: () async => controller.getPerfilPaciente()
                );
              }
              if (state is PerfilPacienteSucess) {
                Paciente dados = state.paciente;
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: CircleAvatar(
                        radius: 70,
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
                      title: 'Médico:',
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
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => const AjudaPage()
                        ),
                        child: const Text('Precisa de ajuda ?')
                      ),
                    ),
                  ],
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
