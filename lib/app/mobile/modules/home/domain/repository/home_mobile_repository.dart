import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';

abstract class HomeMobileRepository {
  Future<Either<Failure,List<InteracaoEntity>>> getInteracoesDoPaciente();
}