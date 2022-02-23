import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/home/domain/repository/home_repository.dart';
import 'package:projeto_csa_app/app/modules/home/infra/datasource/home_datasource.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource homeDatasource;
  HomeRepositoryImpl(this.homeDatasource);

  @override
  Future<Either<Failure, List<Interacao>>> getInteracoesDoPaciente() async {
    try {
      var result = await homeDatasource.getInteracoesDoPaciente();
      return Right(result);
    } on Failure catch (e) {
      throw Left(e);
    }
  }

  @override
  Future<Either<Failure, List<Paciente>>> getPacientes() async {
    try {
      var result = await homeDatasource.getPacientes();
      return Right(result);
    } on Failure catch (e) {
      throw Left(e);
    }
  }
}