import 'package:projeto_csa_app/app/shared/error/failure.dart';

class CommonNoInternetConnectionError extends Failure {}

class CommonNoDataFoundError extends Failure {}

class CommonDesconhecidoError extends Failure {
  CommonDesconhecidoError({message,stack}) : super(
    errorMessage: message,
    stackTrace: stack,
  );
}