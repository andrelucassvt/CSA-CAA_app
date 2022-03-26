part of 'cadastro_paciente_cubit.dart';

@immutable
abstract class CadastroPacienteState {}

class CadastroPacienteInitial extends CadastroPacienteState {}

class CadastroPacienteLoading extends CadastroPacienteState {}

class CadastroPacienteSucess extends CadastroPacienteState {
  final List<InteracaoEntity> interacoes;
  CadastroPacienteSucess(this.interacoes);
}

class CadastroPacienteFailure extends CadastroPacienteState {
  final Failure failure;
  CadastroPacienteFailure(this.failure);
}
