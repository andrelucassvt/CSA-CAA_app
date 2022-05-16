import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/domain/repository/auth_mobile_repository.dart';

class LoginMobileUseCase {

  final AuthMobileRepository repository;
  LoginMobileUseCase({
    required this.repository,
  });
  
  Future<Either<Failure, void>> call({required String cpf}) async {
    return repository.login(cpf: cpf);
  }
}
