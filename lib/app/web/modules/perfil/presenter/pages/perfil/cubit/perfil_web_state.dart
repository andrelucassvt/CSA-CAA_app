part of 'perfil_web_cubit.dart';

@immutable
abstract class PerfilWebState {}

class PerfilWebInitial extends PerfilWebState {}

class PerfilWebLoading extends PerfilWebState {}

class PerfilWebLoaded extends PerfilWebState {
  final MedicoEntity medicoEntity;
  PerfilWebLoaded(this.medicoEntity);
}

class PerfilWebFailure extends PerfilWebState {
  final Failure failure;
  PerfilWebFailure(this.failure);
}
