import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/repository/login_repository.dart';
import 'package:projeto_csa_app/app/shared/common/error/failure.dart';

class LoginMedicoUsecase {
  final LoginRepository loginRepository;
  LoginMedicoUsecase(this.loginRepository);

  Future<Either<Failure,void>> call({required String email, required String senha}) async {
    return loginRepository.loginMedico(email: email, senha: senha);
  }
}