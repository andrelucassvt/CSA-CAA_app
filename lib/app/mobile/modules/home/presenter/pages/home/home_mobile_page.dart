import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/error/common_errors.dart';
import 'package:projeto_csa_app/app/common/models/interacoes_model.dart';
import 'package:projeto_csa_app/app/common/strings_app.dart';
import 'package:projeto_csa_app/app/common/widget/card_grid_widget.dart';
import 'package:projeto_csa_app/app/common/widget/error_view_widget.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/coordinator/home_mobile_coordinator.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/presenter/pages/home/cubit/home_mobile_cubit.dart';
import 'package:projeto_csa_app/app/common/audio_player/player_text_to_voice.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/presenter/widgets/card_grid_frases_personalizadas.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({ Key? key }) : super(key: key);

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  
  final controller = GetIt.I.get<HomeMobileCubit>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight,DeviceOrientation.landscapeLeft]);
    controller.getInteracoes();
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
            onPressed: () => HomeMobileCoordinator.navegarParaPerfil(context),
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () => HomeMobileCoordinator.navegarParaFrasesPersonalizadas(context),
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<HomeMobileCubit, HomeMobileState>(
            bloc: controller,
            builder: (context, state) {
              if (state is HomeMobileLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HomeMobileFailure) {
                if (state.error is CommonNoDataFoundError) {
                  return const Center(
                    child: Text('Você não tem interações'),
                  );
                }
                return ErrorViewWidget(
                  errorMessage: state.error.errorMessage, 
                  actionButton: () async => controller.getInteracoes(),
                );
              }

              if (state is HomeMobileSucess) {
                var dados = state.list;
                return ValueListenableBuilder(
                  valueListenable: Hive.box<InteracaoEntity>(nametable).listenable(),
                  builder: (context,Box<InteracaoEntity> box, _){
                    if (box.values.isEmpty) {
                      return GridView.builder(
                          itemCount: dados.length,
                          scrollDirection: Axis.horizontal,
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              mainAxisExtent: 190,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 20
                          ),
                          itemBuilder: (context, index) {
                            return CardGridWidget(
                              dados: dados[index],
                              actionCard: () async => await PlayerTextToVoice.playerAudio(dados[index].nome!),
                            );
                          }
                      );
                    }
                    dados.insert(0, InteracoesModel(
                        nome: 'Frases Personalizadas',
                        foto: ''
                      )
                    );
                    return GridView.builder(
                        itemCount: dados.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisExtent: 190,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 20
                        ),
                        itemBuilder: (context, index) {
                          return CardGridWidget(
                            dados: dados[index],
                            actionCard: () async => await PlayerTextToVoice.playerAudio(dados[index].nome!),
                          );
                        }
                    );
                  },
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