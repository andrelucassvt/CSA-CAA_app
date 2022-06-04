import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/images/images_app.dart';
import 'package:projeto_csa_app/app/common/widget/card_grid_add_e_remover.dart';
import 'package:projeto_csa_app/app/common/widget/default_button.dart';
import 'package:projeto_csa_app/app/common/widget/error_view_widget.dart';
import 'package:projeto_csa_app/app/common/widget/info_user_title_subtitle.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/cadastrar_paciente/cubit/cadastrar_paciente_cubit.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/detalhes_paciente/cubit/detalhes_paciente_cubit.dart';
import 'package:projeto_csa_app/app/web/modules/home/presenter/pages/escolher_interacoes/cubit/escolher_interacoes_cubit.dart';
import 'package:projeto_csa_app/app/web/util/snackbar/snackbar_web.dart';

class DetalhesPacienteWebPage extends StatefulWidget {
  const DetalhesPacienteWebPage({Key? key}) : super(key: key);

  @override
  State<DetalhesPacienteWebPage> createState() => _DetalhesPacienteWebPageState();
}

class _DetalhesPacienteWebPageState extends State<DetalhesPacienteWebPage> {
  final controller = GetIt.I.get<DetalhesPacienteCubit>();
  final interacoesCubit = GetIt.I.get<EscolherInteracoesCubit>();
  final atualizarIntecoesPaciente = GetIt.I.get<CadastrarPacienteCubit>();

  // Listas de interacoes que serão modificadas
  List<InteracaoEntity> listaInteracoesAtuais = [];
  List<InteracaoEntity> listaInteracoesComplementares = [];

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final args = ModalRoute.of(context)!.settings.arguments as PacienteEntity;;
      controller.getInteracoesPaciente(args.cpf!);
    });
    super.initState();
  }

  _adicionarNaListaInteracoesAtuais(InteracaoEntity interacao) {
    setState(() {
      listaInteracoesComplementares.remove(interacao);
      listaInteracoesAtuais.insert(0, interacao);
    });
  }

  _adicionarNaListaInteracoesComplementares(InteracaoEntity interacao) {
    setState(() {
      listaInteracoesAtuais.remove(interacao);
      listaInteracoesComplementares.insert(0, interacao);
    });
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
      floatingActionButton: BlocConsumer<CadastrarPacienteCubit, CadastrarPacienteState>(
        bloc: atualizarIntecoesPaciente,
        listener: (context, state) {
          if (state is CadastrarPacienteFailure) {
            SnackBarWeb.chamarSnackBarWeb(
              text: state.failure.errorMessage,
              context: context,
            );
          }
          if (state is CadastrarPacienteSucess) {
            SnackBarWeb.chamarSnackBarWeb(
              text: 'Dados atualizados com sucesso', 
              context: context,
              backgroundColor: Colors.blue,
            );
            controller.getInteracoesPaciente(args.cpf!);
            interacoesCubit.getAllInteracoes(args);
          }
        },
        builder: (context, state) {
          if (state is CadastrarPacienteLoading) {
            return const CircularProgressIndicator();
          }
          return FloatingActionButton.extended(
            onPressed: () => atualizarIntecoesPaciente.atualizarInteracoesPaciente(
              pacienteEntity: args, 
              idInteracoes: listaInteracoesAtuais.map((interacao) => interacao.id!).toList(),
            ),
            label: const Text('Salvar paciente'),
            icon: const Icon(Icons.save),
          );
        },
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
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.warning_amber,
                      color: Colors.red,
                    ),
                    Text(
                      'Sua assinatura expira em: 30 dias',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                )
              ],
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: Colors.green,
                  height: double.infinity,
                  width: 400,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10
                        ),
                        child: Text(
                            "Interações atuais",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      const Divider(),
                      BlocConsumer<DetalhesPacienteCubit, DetalhesPacienteState>(
                        bloc: controller,
                        listener: (context,state){
                          if(state is DetalhesPacienteSucess){
                            listaInteracoesAtuais = state.interacoes;
                          }
                        },
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
                            return Expanded(
                              child: GridView.builder(
                                  itemCount: listaInteracoesAtuais.length,
                                  gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 370,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                                  itemBuilder: (context, index) {
                                    return CardGridAddeRemoverWidget(
                                      interacao: listaInteracoesAtuais[index],
                                      isSelected: true,
                                      actionButton: () => _adicionarNaListaInteracoesComplementares(listaInteracoesAtuais[index]),
                                    );
                                  }),
                            );
                          }
                          return SizedBox.fromSize();
                        },
                      ),

                    ],
                  ),
                ),
                Container(
                  color: Colors.blue,
                  height: double.infinity,
                  width: 400,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10,
                        ),
                        child: Text(
                            "Interações complementares",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                      const Divider(),
                      BlocConsumer<EscolherInteracoesCubit, EscolherInteracoesState>(
                        bloc: interacoesCubit,
                        listener: (context,state){
                          if(state is EscolherInteracoesLoaded){
                            listaInteracoesComplementares = state.interacoes;
                            listaInteracoesComplementares.removeWhere((element) {
                              return listaInteracoesAtuais.any((element2) => element2.id == element.id);
                            });
                          }
                        },
                        builder: (context, state) {
                          if (state is EscolherInteracoesInitial){
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 50,
                              ),
                              child: Center(
                                child: DefaultButtonApp(
                                  actionButton: () => interacoesCubit.getAllInteracoes(args),
                                  textButton: 'Carregar interações',
                                ),
                              ),
                            );
                          }
                          if (state is EscolherInteracoesLoading) {
                            return const Expanded(
                              child: Center(child: CircularProgressIndicator(
                                color: Colors.red,
                              )),
                            );
                          }
                          if (state is EscolherInteracoesFailure){
                            return ErrorViewWidget(
                                errorMessage: state.failure.errorMessage,
                                actionButton: () async => controller.getInteracoesPaciente(args.cpf!)
                            );
                          }

                          if (state is EscolherInteracoesLoaded) {
                            return Expanded(
                              child: GridView.builder(
                                  itemCount: listaInteracoesComplementares.length,
                                  gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 370,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                                  itemBuilder: (context, index) {
                                    return CardGridAddeRemoverWidget(
                                      interacao: listaInteracoesComplementares[index],
                                      isSelected: false,
                                      actionButton: () => _adicionarNaListaInteracoesAtuais(listaInteracoesComplementares[index]),
                                    );
                                  }),
                            );
                          }
                          return SizedBox.fromSize();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
