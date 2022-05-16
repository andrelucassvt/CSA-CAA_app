part of 'perfil_mobile_cubit.dart';

@immutable
abstract class PerfilMobileState {}

class PerfilMobileInitial extends PerfilMobileState {}

class PerfilMobileLoading extends PerfilMobileState {}

class PerfilMobileSucess extends PerfilMobileState {
  final PacienteEntity pacienteEntity;
  PerfilMobileSucess({
    required this.pacienteEntity,
  });
}

class PerfilMobileFailure extends PerfilMobileState {
  final Failure failure;
  PerfilMobileFailure({
    required this.failure,
  });
}
