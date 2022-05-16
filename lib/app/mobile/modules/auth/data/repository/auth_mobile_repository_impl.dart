import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/domain/datasource/auth_mobile_datasource.dart';
import 'package:projeto_csa_app/app/mobile/modules/auth/domain/repository/auth_mobile_repository.dart';

class AuthMobileRepositoryImpl extends AuthMobileRepository {

  final AuthMobileDataSource dataSource;
  AuthMobileRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, void>> login({required String cpf}) async {
    try {
      return Right(await dataSource.login(cpf: cpf));
    } on Failure catch (e) {
      return Left(e);
    }
  }
  
}