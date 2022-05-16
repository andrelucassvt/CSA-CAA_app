import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/mobile/modules/home/domain/repository/home_mobile_repository.dart';

class GetMobileInteracoesUseCase {
  final HomeMobileRepository repository;
  GetMobileInteracoesUseCase({
    required this.repository,
  });
  
  Future<Either<Failure, List<InteracaoEntity>>> call() async {
    return await repository.getInteracoesDoPaciente();
  }
}
