import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_pacientes.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

part 'interacoes_medico_pacientes_state.dart';

class InteracoesMedicoPacientesCubit extends Cubit<InteracoesMedicoPacientesState> {
  final GetPacientesUseCase getPacientesUseCase;
  InteracoesMedicoPacientesCubit(
    this.getPacientesUseCase,
  ) : super(InteracoesMedicoPacientesInitial());

  Future<void> getPacientes() async {
    emit(InteracoesMedicoPacientesLoading());
    var result = await getPacientesUseCase();
    emit(result.fold(
      (failure) => InteracoesMedicoPacientesFailure(failure), 
      (sucess) => InteracoesMedicoPacientesSucess(sucess))
    );
  }
}
