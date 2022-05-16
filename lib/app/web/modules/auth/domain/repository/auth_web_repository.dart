import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';

abstract class AuthWebRepository { 
  Future<Either<Failure,void>> login({required String email, required String senha});
}