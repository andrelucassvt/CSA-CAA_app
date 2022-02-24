import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/repository/login_repository.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

class LoginPacienteUsecase {
  final LoginRepository loginRepository;
  LoginPacienteUsecase(this.loginRepository);

  Future<Either<Failure,void>> call(String cpf) async {
    return loginRepository.loginPaciente(cpf);
  }
}