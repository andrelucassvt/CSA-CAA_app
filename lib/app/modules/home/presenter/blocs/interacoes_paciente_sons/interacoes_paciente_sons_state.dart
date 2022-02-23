part of 'interacoes_paciente_sons_cubit.dart';

@immutable
abstract class InteracoesPacienteSonsState {}

class InteracoesPacienteSonsInitial extends InteracoesPacienteSonsState {}

class InteracoesPacienteSonsLoading extends InteracoesPacienteSonsState {}

class InteracoesPacienteSonsSucess extends InteracoesPacienteSonsState {
  final List<Interacao> list;
  InteracoesPacienteSonsSucess(this.list);
}

class InteracoesPacienteSonsFailure extends InteracoesPacienteSonsState {
  final Failure error;
  InteracoesPacienteSonsFailure(this.error);
}
