import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/home_interacoes/home_interacoes_cubit.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/widgets/card_grid_add_e_remover.dart';
import 'package:projeto_csa_app/app/shared/widget/error_view_widget.dart';
import 'package:projeto_csa_app/app/shared/widget/info_user_title_subtitle.dart';

class DetailsPacienteWebPage extends StatefulWidget {
  const DetailsPacienteWebPage({
    Key? key,
  }) : super(key: key);

  @override
  _DetailsPacienteWebPageState createState() => _DetailsPacienteWebPageState();
}

class _DetailsPacienteWebPageState extends State<DetailsPacienteWebPage> {
  final controller = GetIt.I.get<HomeInteracoesCubit>();
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) { 
      final args = ModalRoute.of(context)!.settings.arguments as PacienteEntity;
      controller.getInteracoesDoPaciente(cpf: args.cpf);
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
                const CircleAvatar(
                  radius: 70,
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
              ],
            ),
          ),
          const VerticalDivider(),
          BlocBuilder<HomeInteracoesCubit, HomeInteracoesState>(
            bloc: controller,
            builder: (context, state) {
              if (state is HomeInteracoesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is HomeInteracoesFailure){
                return ErrorViewWidget(
                  errorMessage: state.error.errorMessage, 
                  actionButton: () async => controller.getInteracoesDoPaciente(cpf: args.cpf!)
                );
              }

              if (state is HomeInteracoesSucess) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: 15,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return CardGridAddeRemoverWidget(
                        interacao: InteracaoEntity(nome: 'testee'),
                        actionButton: () {},
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
