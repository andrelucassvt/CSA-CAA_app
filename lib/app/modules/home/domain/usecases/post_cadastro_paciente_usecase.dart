import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/repository/cadastro_paciente_repository.dart';
import 'package:projeto_csa_app/app/shared/common/error/failure.dart';

class PostCadastroPacienteUsecase {
  final CadastroPacienteRepository cadastroPacienteRepository;
  PostCadastroPacienteUsecase(this.cadastroPacienteRepository);

  Future<Either<Failure,void>> call(PacienteEntity pacienteEntity) async {
    return await cadastroPacienteRepository.cadastroDePaciente(pacienteEntity);
  }
}