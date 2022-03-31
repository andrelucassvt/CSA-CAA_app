import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/cadastro_paciente_event/cadastro_paciente_bloc.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/get_all_interacoes/get_all_interacoes_cubit.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/widgets/card_grid_add_e_remover.dart';
import 'package:projeto_csa_app/app/shared/common/snackbar_common/snackbar_common.dart';
import 'package:projeto_csa_app/app/shared/routes/routes.dart';
import 'package:projeto_csa_app/app/shared/widget/error_view_widget.dart';

class EscolherInteracoesWebPage extends StatefulWidget {
  const EscolherInteracoesWebPage({Key? key}) : super(key: key);

  @override
  State<EscolherInteracoesWebPage> createState() =>
      _EscolherInteracoesWebPageState();
}

class _EscolherInteracoesWebPageState extends State<EscolherInteracoesWebPage> {
  final controller = GetIt.I.get<CadastroPacienteBloc>();
  final getAllInteracoesCubit = GetIt.I.get<GetAllInteracoesCubit>();
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
    controller.add(
        CadastrarPacienteEvent(pacienteEntity.copyWith(idInteracoes: listId)));
  }

  @override
  void initState() {
    getAllInteracoesCubit.getAllInteracoes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PacienteEntity;
    return Scaffold(
      floatingActionButton: BlocConsumer<CadastroPacienteBloc, CadastroPacienteState>(
        bloc: controller,
        listener: (context, state) {
          if (state is CadastrarPacienteFailure) {
            SnackbarCommon.chamarSnackBarMobile(
              text: state.failure.errorMessage,
              context: context,
            );
          }
          if (state is CadastrarPacienteSucess) {
            Navigator.of(context).popUntil(ModalRoute.withName(RoutesApp.home));
          }
        },
        builder: (context, state) {
          if (state is CadastroPacienteLoading) {
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
        child: BlocConsumer<GetAllInteracoesCubit, GetAllInteracoesState>(
          bloc: getAllInteracoesCubit,
          listener: (context, state) {
            if (state is GetAllInteracoeSucess) {
              interacoesCopy = state.interacoes;
            }
          },
          builder: (context, state) {
            if (state is GetAllInteracoesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is GetAllInteracoeFailure) {
              return ErrorViewWidget(
                errorMessage: state.failure.errorMessage,
                actionButton: () async =>
                    getAllInteracoesCubit.getAllInteracoes(),
              );
            }
            if (state is GetAllInteracoeSucess) {
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
