import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/home/coordinator/home_coordinator.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/home_interacoes/home_interacoes_cubit.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/player_audio/player_audio_cubit.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/widgets/card_grid_widget.dart';
import 'package:projeto_csa_app/app/shared/common/error/common_errors.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';
import 'package:projeto_csa_app/app/shared/widget/error_view_widget.dart';

class PacienteInteracoesBody extends StatefulWidget {
  const PacienteInteracoesBody({Key? key}) : super(key: key);

  @override
  _PacienteInteracoesBodyState createState() => _PacienteInteracoesBodyState();
}

class _PacienteInteracoesBodyState extends State<PacienteInteracoesBody> {
  final controller = GetIt.I.get<HomeInteracoesCubit>();
  final playerAudio = GetIt.I.get<PlayerAudioCubit>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight,DeviceOrientation.landscapeLeft]);
    controller.getInteracoesDoPaciente();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      HomeCoordinator.mostrarBottomSheetPrimeiroAcesso(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interações'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, RoutesApp.homePerfil), 
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<HomeInteracoesCubit, HomeInteracoesState>(
            bloc: controller,
            builder: (context, state) {
              if (state is HomeInteracoesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HomeInteracoesFailure) {
                if (state.error is CommonNoDataFoundError) {
                  return const Center(
                    child: Text('Você não tem interações'),
                  );
                }
                return ErrorViewWidget(
                  errorMessage: state.error.errorMessage, 
                  actionButton: () async => controller.getInteracoesDoPaciente()
                );
              }

              if (state is HomeInteracoesSucess) {
                var dados = state.list;
                return GridView.builder(
                  itemCount: dados.length,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 190,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20
                  ),
                  itemBuilder: (context, index) {
                    return CardGridWidget(
                      dados: dados[index],
                      actionCard: () async => await playerAudio.playerAudio(dados[index].nome!),
                    );
                  }
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
