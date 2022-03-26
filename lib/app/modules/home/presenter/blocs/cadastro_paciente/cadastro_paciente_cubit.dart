import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';

import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/get_all_interacoes_usecase.dart';
import 'package:projeto_csa_app/app/modules/home/domain/usecases/post_cadastro_paciente_usecase.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

part 'cadastro_paciente_state.dart';

class CadastroPacienteCubit extends Cubit<CadastroPacienteState> {

  final GetAllInteracoesUsecase getAllInteracoesUsecase;
  final PostCadastroPacienteUsecase postCadastroPacienteUsecase;
  CadastroPacienteCubit(
    this.getAllInteracoesUsecase,
    this.postCadastroPacienteUsecase,
  ) : super(CadastroPacienteInitial());

  Future<void> cadastrarPaciente(PacienteEntity pacienteEntity) async {
    emit(CadastroPacienteLoading());
  }

  Future<void> getAllInteracoes() async {
    emit(CadastroPacienteLoading());
    final result = await getAllInteracoesUsecase();
    emit(result.fold(
      (failure) => CadastroPacienteFailure(failure),
      (interacoes) => CadastroPacienteSucess(interacoes),
    ));
  }
}
