import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

class HomeNoInternetConnection extends Failure {}

class HomeNoDataFound extends Failure {}

class HomeUnkenError extends Failure {
  HomeUnkenError({message,stack}) : super(
    errorMessage: message,
    stackTrace: stack,
  );
}

