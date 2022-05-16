
import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/auth/domain/repository/auth_web_repository.dart';

class LoginWebUseCase {
  final AuthWebRepository authWebRepository;
  LoginWebUseCase({
    required this.authWebRepository,
  });

  Future<Either<Failure, void>> call({required String email, required String senha}) async {
    return await authWebRepository.login(email: email, senha: senha);
  }
}
