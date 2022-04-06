import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/repository/perfil_repository.dart';
import 'package:projeto_csa_app/app/shared/common/error/failure.dart';

class GetPerfilPacienteUsecase {

  final PerfilRepository perfilRepository;
  GetPerfilPacienteUsecase({
    required this.perfilRepository,
  });
  
  Future<Either<Failure,PacienteEntity>> call() async {
    return await perfilRepository.getPerfilPaciente();
  }
}