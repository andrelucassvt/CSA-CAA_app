import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure,void>> loginPaciente(String cpf);
  Future<Either<Failure,void>> loginMedico({required String email, required String senha});
}