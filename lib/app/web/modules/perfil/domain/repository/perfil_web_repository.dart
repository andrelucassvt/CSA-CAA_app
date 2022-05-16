import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/medico.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';

abstract class PerfilWebRepository {
  Future<Either<Failure,MedicoEntity>> getPerfil();
}