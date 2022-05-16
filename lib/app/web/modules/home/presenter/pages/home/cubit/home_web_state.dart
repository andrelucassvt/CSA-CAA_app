part of 'home_web_cubit.dart';

@immutable
abstract class HomeWebState {}

class HomeWebInitial extends HomeWebState {}

class HomeWebLoading extends HomeWebState {}

class HomeWebSucess extends HomeWebState {
  final List<PacienteEntity> list;
  HomeWebSucess(this.list);
}

class HomeWebFailure extends HomeWebState {
  final Failure error;
  HomeWebFailure(this.error);
}



