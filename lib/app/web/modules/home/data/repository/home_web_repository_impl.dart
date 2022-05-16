import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/datasource/home_web_datasource.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/repository/home_web_repository.dart';

class HomeWebRepositoryImpl implements HomeWebRepository {

  final HomeWebDatasource homeWebDatasource;
  HomeWebRepositoryImpl(this.homeWebDatasource);

  @override
  Future<Either<Failure, void>> cadastroDoPaciente(PacienteEntity pacienteEntity) async {
    try {
      var result = await homeWebDatasource.cadastroDePaciente(pacienteEntity);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<InteracaoEntity>>> getAllInteracoes(PacienteEntity pacienteEntity) async {
    try {
      var result = await homeWebDatasource.getAllInteracoes(pacienteEntity);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<InteracaoEntity>>> getInteracoesDoPaciente({String? cpf}) async {
    try {
      var result = await homeWebDatasource.getInteracoesDoPaciente(cpf: cpf);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<PacienteEntity>>> getPacientes() async {
    try {
      var result = await homeWebDatasource.getPacientes();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }


}