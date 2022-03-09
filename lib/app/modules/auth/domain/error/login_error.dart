import 'package:projeto_csa_app/app/shared/error/failure.dart';

class LoginNoInternetConnection extends Failure {}

class LoginNoDataFound extends Failure {}

class LoginUnkenError extends Failure {
  LoginUnkenError({message,stack}) : super(
    errorMessage: message,
    stackTrace: stack
  );
}
