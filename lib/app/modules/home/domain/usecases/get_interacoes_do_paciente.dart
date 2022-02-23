import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/repository/home_repository.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

class GetInteracoesDoPacienteUsecase {
  final HomeRepository homeRepository;
  GetInteracoesDoPacienteUsecase(this.homeRepository);

  Future<Either<Failure, List<Interacao>>> call() async {
    return await homeRepository.getInteracoesDoPaciente();
  }
}