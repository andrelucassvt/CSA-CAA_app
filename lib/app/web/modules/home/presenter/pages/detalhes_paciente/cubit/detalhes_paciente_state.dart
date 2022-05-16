part of 'detalhes_paciente_cubit.dart';

@immutable
abstract class DetalhesPacienteState {}

class DetalhesPacienteInitial extends DetalhesPacienteState {}

class DetalhesPacienteLoading extends DetalhesPacienteState {}

class DetalhesPacienteSucess extends DetalhesPacienteState {
  final List<InteracaoEntity> interacoes;
  DetalhesPacienteSucess(this.interacoes);
}

class DetalhesPacienteFailure extends DetalhesPacienteState {
  final Failure error;
  DetalhesPacienteFailure(this.error);
}
