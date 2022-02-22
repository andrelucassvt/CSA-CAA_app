import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/home/domain/repository/home_repository.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<Failure, List<Interacao>>> getInteracoesDoPaciente() async {
    // TODO: implement getInteracoesDoPaciente
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Paciente>>> getPacientes() async {
    // TODO: implement getPacientes
    throw UnimplementedError();
  }
  
}