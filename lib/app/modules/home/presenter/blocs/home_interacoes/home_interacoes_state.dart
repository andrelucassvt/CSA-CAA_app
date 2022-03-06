part of 'home_interacoes_cubit.dart';

@immutable
abstract class HomeInteracoesState {}

class HomeInteracoesInitial extends HomeInteracoesState {}

class HomeInteracoesLoading extends HomeInteracoesState  {}

class InteracoesPacienteSonsSucess extends HomeInteracoesState  {
  final List<InteracaoEntity> list;
  InteracoesPacienteSonsSucess(this.list);
}

class InteracoesMedicoPacientesSucess extends HomeInteracoesState {
  final List<PacienteEntity> list;
  InteracoesMedicoPacientesSucess(this.list);
}

class HomeInteracoesFailure extends HomeInteracoesState  {
  final Failure error;
  HomeInteracoesFailure(this.error);
}
