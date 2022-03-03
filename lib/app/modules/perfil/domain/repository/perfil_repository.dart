import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/medico.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

abstract class PerfilRepository {
  Future<Either<Failure,Paciente>> getPerfilPaciente();
  Future<Either<Failure,Medico>> getPerfilMedico();
}