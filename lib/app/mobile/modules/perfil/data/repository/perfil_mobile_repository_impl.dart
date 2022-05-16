import 'package:dartz/dartz.dart';

import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/domain/datasource/perfil_mobile_datasource.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/domain/repository/perfil_mobile_repository.dart';

class PerfilMobileRepositoryImpl implements PerfilMobileRepository {
  final PerfilMobileDatasource datasource;
  PerfilMobileRepositoryImpl({
    required this.datasource,
  });
  
  @override
  Future<Either<Failure, PacienteEntity>> getPerfil() async {
    try {
      var result = await datasource.getPerfil();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
  
}
