import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/medico.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/domain/datasource/perfil_web_datasource.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/domain/repository/perfil_web_repository.dart';

class PerfilWebRepositoryImpl implements PerfilWebRepository {

  final PerfilWebDatasource perfilWebDatasource;
  PerfilWebRepositoryImpl(this.perfilWebDatasource);

  @override
  Future<Either<Failure, MedicoEntity>> getPerfil() async {
    try {
      var result = await perfilWebDatasource.getPerfil();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

}