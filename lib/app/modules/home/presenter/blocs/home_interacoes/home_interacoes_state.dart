part of 'home_interacoes_cubit.dart';

@immutable
abstract class HomeInteracoesState {}

class HomeInteracoesInitial extends HomeInteracoesState {}

class HomeInteracoesLoading extends HomeInteracoesState  {}

class HomeInteracoesSucess extends HomeInteracoesState  {
  final List<InteracaoEntity> list;
  HomeInteracoesSucess(this.list);
}

class HomePacientesSucess extends HomeInteracoesState {
  final List<PacienteEntity> list;
  HomePacientesSucess(this.list);
}

class HomeInteracoesFailure extends HomeInteracoesState  {
  final Failure error;
  HomeInteracoesFailure(this.error);
}
