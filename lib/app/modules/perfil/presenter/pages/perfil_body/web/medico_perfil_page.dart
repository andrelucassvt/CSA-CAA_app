import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/blocs/perfil/perfil_cubit.dart';
import 'package:projeto_csa_app/app/modules/perfil/presenter/components/logout_button.dart';
import 'package:projeto_csa_app/app/shared/widget/error_view_widget.dart';
import 'package:projeto_csa_app/app/shared/widget/info_user_title_subtitle.dart';

class MedicoPerfilPage extends StatefulWidget {
  const MedicoPerfilPage({Key? key}) : super(key: key);

  @override
  _MedicoPerfilPageState createState() => _MedicoPerfilPageState();
}

class _MedicoPerfilPageState extends State<MedicoPerfilPage> {
  final controller = GetIt.I.get<PerfilCubit>();

  @override
  void initState() {
    super.initState();
    controller.getPerfilMedico();
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
        backgroundColor: Colors.transparent,
        title: const Text(
          'Central',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0.0,
      ),
      body: BlocBuilder<PerfilCubit, PerfilState>(
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
              actionButton: () async => controller.getPerfilMedico()
            );
          }
          if (state is PerfilMedicoSucess) {
            var dados = state.medico;
            return Column(
              children: [
                const CircleAvatar(
                  radius: 70,
                ),
                const SizedBox(
                  height: 20,
                ),
                InfoUserTitleSubTitleWidget(
                  title: 'Nome:',
                  subtitle: dados.nome ?? 'Sem informação',
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                InfoUserTitleSubTitleWidget(
                  title: 'Hospital:',
                  subtitle: dados.hospital ?? 'Sem informação',
                  crossAxisAlignment: CrossAxisAlignment.center,
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
