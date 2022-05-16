part of 'escolher_interacoes_cubit.dart';

@immutable
abstract class EscolherInteracoesState {}

class EscolherInteracoesInitial extends EscolherInteracoesState {}

class EscolherInteracoesLoading extends EscolherInteracoesState {}

class EscolherInteracoesLoaded extends EscolherInteracoesState {
  final List<InteracaoEntity> interacoes;
  EscolherInteracoesLoaded(this.interacoes);
}

class EscolherInteracoesFailure extends EscolherInteracoesState {
  final Failure failure;
  EscolherInteracoesFailure(this.failure);
}
