part of 'cadastro_paciente_bloc.dart';

@immutable
abstract class CadastropacienteEvent {}


class CadastrarPacienteEvent extends CadastropacienteEvent {
  final PacienteEntity pacienteEntity;
  CadastrarPacienteEvent(this.pacienteEntity);
}
  
