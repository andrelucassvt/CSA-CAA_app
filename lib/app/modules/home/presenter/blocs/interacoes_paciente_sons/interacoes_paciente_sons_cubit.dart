import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_interacoes_do_paciente.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

part 'interacoes_paciente_sons_state.dart';

class InteracoesPacienteSonsCubit extends Cubit<InteracoesPacienteSonsState> {
  final GetInteracoesDoPacienteUsecase getInteracoesDoPacienteUsecase;
  InteracoesPacienteSonsCubit(
    this.getInteracoesDoPacienteUsecase,
  ) : super(InteracoesPacienteSonsInitial());

  Future<void> getInteracoesPaciente() async {
    emit(InteracoesPacienteSonsInitial());
    var result = await getInteracoesDoPacienteUsecase();
    emit(result.fold(
      (failure) => InteracoesPacienteSonsFailure(failure), 
      (sucess) => InteracoesPacienteSonsSucess(sucess))
    );
  }
}
