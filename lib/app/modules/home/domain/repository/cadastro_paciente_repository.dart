import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

abstract class CadastroPacienteRepository {
  Future<Either<Failure,void>> cadastroDePaciente(PacienteEntity pacienteEntity);
  Future<Either<Failure,List<InteracaoEntity>>> getAllInteracoes();
}