import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';

abstract class HomeWebRepository {
  Future<Either<Failure, List<InteracaoEntity>>> getInteracoesDoPaciente({String? cpf});
  Future<Either<Failure, List<PacienteEntity>>> getPacientes();

  Future<Either<Failure, void>> cadastroDoPaciente(PacienteEntity pacienteEntity);
  Future<Either<Failure, void>> atualizarInteracoesPaciente({required PacienteEntity pacienteEntity, required List<int> idInteracoes});
  Future<Either<Failure, List<InteracaoEntity>>> getAllInteracoes(PacienteEntity pacienteEntity);
}