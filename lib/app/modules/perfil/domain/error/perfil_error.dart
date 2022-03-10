import 'package:projeto_csa_app/app/shared/error/failure.dart';

class PerfilNoInternetConnection extends Failure {}

class PerfilUnkenError extends Failure {
  PerfilUnkenError({message,stack}) : super(
    errorMessage: message,
    stackTrace: stack
  );
}