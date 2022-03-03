import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/medico.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';

import 'package:projeto_csa_app/app/modules/perfil/domain/usecases/get_perfil_medico.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/usecases/get_perfil_paciente.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

part 'perfil_state.dart';

class PerfilCubit extends Cubit<PerfilState> {
  final GetPerfilMedicoUsecase getPerfilMedicoUsecase;
  final GetPerfilPacienteUsecase getPerfilPacienteUsecase;
  PerfilCubit(
    this.getPerfilMedicoUsecase,
    this.getPerfilPacienteUsecase,
  ) : super(PerfilInitial());

  Future<void> getPerfilPaciente() async {
    emit(PerfilLoading());
    var result = await getPerfilPacienteUsecase();
    emit(result.fold(
      (failure) => PerfilFailure(failure), 
      (sucess) => PerfilPacienteSucess(sucess)
    ));
  }
  Future<void> getPerfilMedico() async {
    emit(PerfilLoading());
    var result = await getPerfilMedicoUsecase();
    emit(result.fold(
      (failure) => PerfilFailure(failure), 
      (sucess) => PerfilMedicoSucess(sucess)
    ));
  }
}
