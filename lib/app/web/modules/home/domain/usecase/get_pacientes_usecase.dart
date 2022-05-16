import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/repository/home_web_repository.dart';

class GetPacientesUsecase {
  final HomeWebRepository homeWebRepository;
  GetPacientesUsecase(this.homeWebRepository);

  Future<Either<Failure,List<PacienteEntity>>> call() async {
    return await homeWebRepository.getPacientes();
  }
}