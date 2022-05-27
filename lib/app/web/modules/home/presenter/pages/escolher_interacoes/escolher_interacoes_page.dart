import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/widget/error_view_widget.dart';
import 'package:projeto_csa_app/app/common/widget/card_grid_add_e_remover.dart';
import 'package:projeto_csa_app/app/web/modules/home/coordinator/home_web_coordinator.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/cadastrar_paciente/cubit/cadastrar_paciente_cubit.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/escolher_interacoes/cubit/escolher_interacoes_cubit.dart';
import 'package:projeto_csa_app/app/web/util/snackbar/snackbar_web.dart';

class EscolherInteracoesWebPage extends StatefulWidget {
  const EscolherInteracoesWebPage({Key? key}) : super(key: key);

  @override
  State<EscolherInteracoesWebPage> createState() => _EscolherInteracoesWebPageState();
}

class _EscolherInteracoesWebPageState extends State<EscolherInteracoesWebPage> {
  final controller = GetIt.I.get<CadastrarPacienteCubit>();
  final getAllInteracoesCubit = GetIt.I.get<EscolherInteracoesCubit>();
  List<InteracaoEntity> interacoesCopy = [];

  void marcarInteracoes(InteracaoEntity interacao) {
    final List<InteracaoEntity> data = List.from(interacoesCopy);
    data[data.indexOf(interacao)] =
        interacao.copyWith(isSelect: !interacao.isSelect);
    setState(() {
      interacoesCopy = data;
    });
  }

  void cadastrarPaciente(PacienteEntity pacienteEntity) {
    final List<InteracaoEntity> interacoes =
    interacoesCopy.where((interacao) => interacao.isSelect).toList();
    var listId = interacoes.map((element) => element.id!).toList();
    controller.cadastrarPaciente(pacienteEntity.copyWith(idInteracoes: listId));
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments as PacienteEntity;
      getAllInteracoesCubit.getAllInteracoes(args);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PacienteEntity;
    return Scaffold(
      floatingActionButton: BlocConsumer<CadastrarPacienteCubit, CadastrarPacienteState>(
        bloc: controller,
        listener: (context, state) {
          if (state is CadastrarPacienteFailure) {
            SnackBarWeb.chamarSnackBarWeb(
              text: state.failure.errorMessage,
              context: context,
            );
          }
          if (state is CadastrarPacienteSucess) {
            HomeWebCoordinator.voltarParaHome(context);
          }
        },
        builder: (context, state) {
          if (state is CadastrarPacienteLoading) {
            return const CircularProgressIndicator();
          }
          return FloatingActionButton.extended(
            onPressed: () => cadastrarPaciente(args),
            label: const Text('Salvar paciente'),
            icon: const Icon(Icons.save),
          );
        },
      ),
      appBar: AppBar(
        title: const Text('Escolher interações do cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<EscolherInteracoesCubit, EscolherInteracoesState>(
          bloc: getAllInteracoesCubit,
          listener: (context, state) {
            if (state is EscolherInteracoesLoaded) {
              interacoesCopy = state.interacoes;
            }
          },
          builder: (context, state) {
            if (state is EscolherInteracoesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is EscolherInteracoesFailure) {
              return ErrorViewWidget(
                errorMessage: state.failure.errorMessage,
                actionButton: () async =>
                    getAllInteracoesCubit.getAllInteracoes(args),
              );
            }
            if (state is EscolherInteracoesLoaded) {
              var dados = interacoesCopy;
              return GridView.builder(
                  itemCount: dados.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return CardGridAddeRemoverWidget(
                        interacao: dados[index],
                        isSelected: dados[index].isSelect,
                        actionButton: () => marcarInteracoes(dados[index]));
                  });
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
