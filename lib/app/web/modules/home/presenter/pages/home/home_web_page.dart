import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/common/widget/card_grid_widget.dart';
import 'package:projeto_csa_app/app/common/widget/error_view_widget.dart';
import 'package:projeto_csa_app/app/web/modules/home/coordinator/home_web_coordinator.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/home/cubit/home_web_cubit.dart';

class HomeWebPage extends StatefulWidget {
  const HomeWebPage({Key? key}) : super(key: key);

  @override
  State<HomeWebPage> createState() => _HomeWebPageState();
}

class _HomeWebPageState extends State<HomeWebPage> {
  final controller = GetIt.I.get<HomeWebCubit>();

  @override
  void initState() {
    controller.getPacientes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => HomeWebCoordinator.navegarParaPerfil(context),
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () async => controller.getPacientes(),
            icon: const Icon(Icons.replay_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => HomeWebCoordinator.navegarParaCadastrarPaciente(context),
        label: const Text('Cadastrar Paciente'),
        icon: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<HomeWebCubit, HomeWebState>(
          bloc: controller,
          builder: (context, state) {

            if (state is HomeWebLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is HomeWebFailure) {
              return ErrorViewWidget(
                  errorMessage: state.error.errorMessage,
                  actionButton: () async => await controller.getPacientes()
              );
            }

            if (state is HomeWebSucess) {
              var dados = state.list;
              return GridView.builder(
                  itemCount: dados.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20
                  ),
                  itemBuilder: (context, index) {
                    return CardGridWidget(
                        dados: dados[index],
                        actionCard: () => HomeWebCoordinator.navegarParaDetalhesPaciente(
                          context: context,
                          pacienteEntity: dados[index],
                        )
                    );
                  }
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
