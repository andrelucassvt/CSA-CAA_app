import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/usecase/cadastro_do_paciente_usecase.dart';

part 'cadastrar_paciente_state.dart';

class CadastrarPacienteCubit extends Cubit<CadastrarPacienteState> {

  final CadastroDoPacienteUsecase cadastroDoPacienteUsecase;
  CadastrarPacienteCubit({
    required this.cadastroDoPacienteUsecase,
  }) : super(CadastrarPacienteInitial());

  Future<void> cadastrarPaciente(PacienteEntity pacienteEntity) async {
    emit(CadastrarPacienteLoading());
    final result = await cadastroDoPacienteUsecase(pacienteEntity);
    emit(result.fold(
      (failure) => CadastrarPacienteFailure(failure),
      (_) => CadastrarPacienteSucess(),
    ));
  }

}
