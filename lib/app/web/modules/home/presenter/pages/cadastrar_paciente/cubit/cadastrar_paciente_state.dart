part of 'cadastrar_paciente_cubit.dart';

@immutable
abstract class CadastrarPacienteState {}

class CadastrarPacienteInitial extends CadastrarPacienteState {}

class CadastrarPacienteLoading extends CadastrarPacienteState {}

class CadastrarPacienteSucess extends CadastrarPacienteState {}

class CadastrarPacienteFailure extends CadastrarPacienteState {
  final Failure failure;
  CadastrarPacienteFailure(this.failure);
}
