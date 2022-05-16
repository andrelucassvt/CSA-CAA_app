import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';

import 'package:projeto_csa_app/app/mobile/modules/home/domain/datasource/home_mobile_datasource.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/domain/repository/home_mobile_repository.dart';

class HomeMobileRepositoryImpl extends HomeMobileRepository {

  final HomeMobileDataSource dataSource;
  HomeMobileRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<InteracaoEntity>>> getInteracoesDoPaciente() async {
    try {
      var result = await dataSource.getInteracoesDoPaciente();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
  
}
