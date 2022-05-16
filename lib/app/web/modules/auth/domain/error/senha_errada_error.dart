
import 'package:projeto_csa_app/app/common/error/failure.dart';

class PasswordNoFoundError extends Failure {
  PasswordNoFoundError({
    String? message,
    StackTrace? stackTrace
  }) : super(
    errorMessage: message ?? 'Senha incorreta',
    stackTrace: stackTrace
  );
}