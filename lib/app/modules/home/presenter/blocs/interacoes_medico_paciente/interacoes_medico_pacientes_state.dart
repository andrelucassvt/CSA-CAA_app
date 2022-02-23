part of 'interacoes_medico_pacientes_cubit.dart';

@immutable
abstract class InteracoesMedicoPacientesState {}

class InteracoesMedicoPacientesInitial extends InteracoesMedicoPacientesState {}

class InteracoesMedicoPacientesLoading extends InteracoesMedicoPacientesState {}

class InteracoesMedicoPacientesSucess extends InteracoesMedicoPacientesState {
  final List<Paciente> list;
  InteracoesMedicoPacientesSucess(this.list);
}

class InteracoesMedicoPacientesFailure extends InteracoesMedicoPacientesState {
  final Failure failure;
  InteracoesMedicoPacientesFailure(this.failure);
}
