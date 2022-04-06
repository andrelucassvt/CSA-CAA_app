import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/medico.dart';
import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/datasource/perfil_datasource.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/repository/perfil_repository.dart';
import 'package:projeto_csa_app/app/shared/common/error/failure.dart';

class PerfilRepositoryImpl implements PerfilRepository {
  final PerfilDatasource perfilDatasource;
  PerfilRepositoryImpl(this.perfilDatasource);

  @override
  Future<Either<Failure, MedicoEntity>> getPerfilMedico() async {
    try {
      var result = await perfilDatasource.getPerfilMedico();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, PacienteEntity>> getPerfilPaciente() async {
    try {
      var result = await perfilDatasource.getPerfilPaciente();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
  
}