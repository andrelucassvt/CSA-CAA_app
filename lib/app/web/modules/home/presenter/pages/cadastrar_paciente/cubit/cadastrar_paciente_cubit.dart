import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/usecase/atualizar_interacoes_paciente_usecase.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/usecase/cadastro_do_paciente_usecase.dart';

part 'cadastrar_paciente_state.dart';

class CadastrarPacienteCubit extends Cubit<CadastrarPacienteState> {

  final CadastroDoPacienteUsecase cadastroDoPacienteUsecase;
  final AtualizarInteracoesPacienteUsecase atualizarInteracoesPacienteUsecase;
  CadastrarPacienteCubit({
    required this.cadastroDoPacienteUsecase,
    required this.atualizarInteracoesPacienteUsecase,
  }) : super(CadastrarPacienteInitial());

  Future<void> cadastrarPaciente(PacienteEntity pacienteEntity) async {
    emit(CadastrarPacienteLoading());
    final result = await cadastroDoPacienteUsecase(pacienteEntity);
    emit(result.fold(
      (failure) => CadastrarPacienteFailure(failure),
      (_) => CadastrarPacienteSucess(),
    ));
  }

  Future<void> atualizarInteracoesPaciente({ required PacienteEntity pacienteEntity, required List<int> idInteracoes}) async {
    emit(CadastrarPacienteLoading());
    final result = await atualizarInteracoesPacienteUsecase(pacienteEntity: pacienteEntity, idInteracoes: idInteracoes);
    emit(result.fold(
      (failure) => CadastrarPacienteFailure(failure),
      (_) => CadastrarPacienteSucess(),
    ));
  }

}
