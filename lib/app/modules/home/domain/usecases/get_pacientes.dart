import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/repository/home_repository.dart';
import 'package:projeto_csa_app/app/shared/common/error/failure.dart';

class GetPacientesUseCase {
  final HomeRepository homeRepository;
  GetPacientesUseCase(this.homeRepository);

  Future<Either<Failure,List<PacienteEntity>>> call() async {
    return homeRepository.getPacientes();
  }
}