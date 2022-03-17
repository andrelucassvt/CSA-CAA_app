import 'package:projeto_csa_app/app/shared/error/failure.dart';

class CommonNoInternetConnectionError extends Failure {
  CommonNoInternetConnectionError({message,stack}) : super (
    errorMessage: message ?? "Sem conexão com a internet",
    stackTrace: stack
  );
}

class CommonNoDataFoundError extends Failure {
  CommonNoDataFoundError({message,stack}) : super(
    errorMessage: message,
    stackTrace: stack,
  );
}

class CommonDesconhecidoError extends Failure {
  CommonDesconhecidoError({message,stack}) : super(
    errorMessage: message,
    stackTrace: stack,
  );
}