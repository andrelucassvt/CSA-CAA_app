import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/datasource/login_datasource.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/repository/login_repository.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource loginDatasource;
  LoginRepositoryImpl(this.loginDatasource);

  @override
  Future<Either<Failure, void>> loginMedico({required String email, required String senha}) async {
    try {
      return Right(await loginDatasource.loginMedico(email: email, senha: senha));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> loginPaciente(String cpf) async {
    try {
      return Right(await loginDatasource.loginPaciente(cpf));
    } on Failure catch (e) {
      return Left(e);
    }
  }
  
}