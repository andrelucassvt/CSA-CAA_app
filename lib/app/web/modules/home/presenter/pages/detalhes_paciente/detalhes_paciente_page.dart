import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/images/images_app.dart';
import 'package:projeto_csa_app/app/common/widget/card_grid_widget.dart';
import 'package:projeto_csa_app/app/common/widget/error_view_widget.dart';
import 'package:projeto_csa_app/app/common/widget/info_user_title_subtitle.dart';
import 'package:projeto_csa_app/app/web/modules/home/coordinator/home_web_coordinator.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/detalhes_paciente/cubit/detalhes_paciente_cubit.dart';

class DetalhesPacienteWebPage extends StatefulWidget {
  const DetalhesPacienteWebPage({Key? key}) : super(key: key);

  @override
  State<DetalhesPacienteWebPage> createState() => _DetalhesPacienteWebPageState();
}

class _DetalhesPacienteWebPageState extends State<DetalhesPacienteWebPage> {
  final controller = GetIt.I.get<DetalhesPacienteCubit>();
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final args = ModalRoute.of(context)!.settings.arguments as PacienteEntity;
      controller.getInteracoesPaciente(args.cpf!);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PacienteEntity;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Paciente',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => HomeWebCoordinator.navegarParaEscolherInteracoes(
          context: context,
          pacienteEntity: args,
        ),
        label: const Text('Editar'),
        icon: const Icon(Icons.edit),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  subtitle: args.nome!,
                ),
                InfoUserTitleSubTitleWidget(
                  title: 'Responsável:',
                  subtitle: args.responsavel!,
                ),
                InfoUserTitleSubTitleWidget(
                  title: 'Fase:',
                  subtitle: args.fase!,
                ),
              ],
            ),
          ),
          const VerticalDivider(),
          BlocBuilder<DetalhesPacienteCubit, DetalhesPacienteState>(
            bloc: controller,
            builder: (context, state) {
              if (state is DetalhesPacienteLoading) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (state is DetalhesPacienteFailure){
                return ErrorViewWidget(
                    errorMessage: state.error.errorMessage,
                    actionButton: () async => controller.getInteracoesPaciente(args.cpf!)
                );
              }

              if (state is DetalhesPacienteSucess) {
                final data = state.interacoes;
                return Expanded(
                  child: GridView.builder(
                      itemCount: data.length,
                      gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        return CardGridWidget(
                          dados: data[index],
                          actionCard: (){},
                        );
                      }),
                );
              }
              return SizedBox.fromSize();
            },
          ),
        ],
      ),
    );
  }
}
