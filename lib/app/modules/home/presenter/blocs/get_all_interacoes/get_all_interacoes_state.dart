part of 'get_all_interacoes_cubit.dart';

@immutable
abstract class GetAllInteracoesState {}

class GetAllInteracoesInitial extends GetAllInteracoesState {}

class GetAllInteracoesLoading extends GetAllInteracoesState {}

class GetAllInteracoeSucess extends GetAllInteracoesState {
  final List<InteracaoEntity> interacoes;
  GetAllInteracoeSucess(this.interacoes);
}

class GetAllInteracoeFailure extends GetAllInteracoesState {
  final Failure failure;
 GetAllInteracoeFailure(this.failure);
}