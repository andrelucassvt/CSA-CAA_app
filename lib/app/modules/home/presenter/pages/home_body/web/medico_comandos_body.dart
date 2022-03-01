import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/blocs/home_interacoes/home_interacoes_cubit.dart';
import 'package:projeto_csa_app/app/modules/home/presenter/widgets/card_grid_widget.dart';

class MedicoComandosBody extends StatefulWidget {
  const MedicoComandosBody({Key? key}) : super(key: key);

  @override
  _MedicoComandosBodyState createState() => _MedicoComandosBodyState();
}

class _MedicoComandosBodyState extends State<MedicoComandosBody> {
  final controller = GetIt.I.get<HomeInteracoesCubit>();

  @override
  void initState() {
    super.initState();
    controller.getPacientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              return const Center(
                child: Text('Error ao carregar dados'),
              );
            }

            if (state is InteracoesMedicoPacientesSucess) {
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
                  );
                }
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
