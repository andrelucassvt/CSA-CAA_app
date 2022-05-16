import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';

abstract class PerfilMobileRepository {
  Future<Either<Failure,PacienteEntity>> getPerfil();
}