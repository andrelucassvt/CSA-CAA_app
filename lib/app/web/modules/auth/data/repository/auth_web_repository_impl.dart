import 'package:dartz/dartz.dart';

import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/auth/domain/datasource/auth_web_datasource.dart';
import 'package:projeto_csa_app/app/web/modules/auth/domain/repository/auth_web_repository.dart';

class AuthWebRepositoryImpl extends AuthWebRepository {
  final AuthWebDatasource datasource;
  AuthWebRepositoryImpl({
    required this.datasource,
  });
  
  @override
  Future<Either<Failure, void>> login({required String email, required String senha}) async {
    try {
      return Right(await datasource.login(email: email, senha: senha));
    } on Failure catch (e) {
      return Left(e);
    }
  }
  
}
