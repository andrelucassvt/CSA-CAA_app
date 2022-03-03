part of 'perfil_cubit.dart';

@immutable
abstract class PerfilState {}

class PerfilInitial extends PerfilState {}

class PerfilLoading extends PerfilState {}

class PerfilPacienteSucess extends PerfilState {
  final Paciente paciente;
  PerfilPacienteSucess(this.paciente);
}

class PerfilMedicoSucess extends PerfilState {
  final Medico medico;
  PerfilMedicoSucess(this.medico);
}

class PerfilFailure extends PerfilState {
  final Failure failure;
  PerfilFailure(this.failure);
}
