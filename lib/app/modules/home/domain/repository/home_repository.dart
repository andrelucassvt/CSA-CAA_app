import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/shared/common/error/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<InteracaoEntity>>> getInteracoesDoPaciente({String? cpf});
  Future<Either<Failure, List<PacienteEntity>>> getPacientes();
}