import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/repository/home_web_repository.dart';

class CadastroDoPacienteUsecase {

  final HomeWebRepository homeWebRepository;
  CadastroDoPacienteUsecase(this.homeWebRepository);

  Future<Either<Failure,void>> call(PacienteEntity pacienteEntity) async {
    return await homeWebRepository.cadastroDoPaciente(pacienteEntity);
  }

}
