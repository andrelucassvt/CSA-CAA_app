import 'package:projeto_csa_app/app/modules/home/domain/datasource/home_datasource.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/home/domain/repository/home_repository.dart';
import 'package:projeto_csa_app/app/shared/common/error/failure.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource homeDatasource;
  HomeRepositoryImpl(this.homeDatasource);

  @override
  Future<Either<Failure, List<InteracaoEntity>>> getInteracoesDoPaciente({String? cpf}) async {
    try {
      var result = await homeDatasource.getInteracoesDoPaciente(cpf: cpf);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<PacienteEntity>>> getPacientes() async {
    try {
      var result = await homeDatasource.getPacientes();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}