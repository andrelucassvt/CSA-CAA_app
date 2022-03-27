part of 'cadastro_paciente_bloc.dart';

@immutable
abstract class CadastroPacienteState {}

class CadastroPacienteInitial extends CadastroPacienteState {}

class CadastroPacienteLoading extends CadastroPacienteState {}

class CadastrarPacienteSucess extends CadastroPacienteState {}

class CadastrarPacienteFailure extends CadastroPacienteState {
  final Failure failure;
  CadastrarPacienteFailure(this.failure);
}

class GetAllInteracoesLoading extends CadastroPacienteState {}

class GetAllInteracoeSucess extends CadastroPacienteState {
  final List<InteracaoEntity> interacoes;
  GetAllInteracoeSucess(this.interacoes);
}

class GetAllInteracoeFailure extends CadastroPacienteState {
  final Failure failure;
 GetAllInteracoeFailure(this.failure);
}
