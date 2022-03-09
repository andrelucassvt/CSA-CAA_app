import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/home_interacoes/home_interacoes_cubit.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/player_audio/player_audio_cubit.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/widgets/card_grid_widget.dart';
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
    controller.getInteracoesDoPaciente();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            return ErrorViewWidget(
              errorMessage: state.error.errorMessage, 
              actionButton: () async => controller.getInteracoesDoPaciente()
            );
          }

          if (state is InteracoesPacienteSonsSucess) {
            var dados = state.list;
            return GridView.builder(
              itemCount: dados.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
              ),
              itemBuilder: (context, index) {
                return CardGridWidget(
                  dados: dados[index],
                  actionCard: () async => await playerAudio.playerAudio('audios/teste.mp3'),
                );
              }
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
