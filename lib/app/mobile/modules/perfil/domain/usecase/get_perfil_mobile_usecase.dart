import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/domain/repository/perfil_mobile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';

class GetPerfilMobileUseCase {
  final PerfilMobileRepository perfilRepository;
  GetPerfilMobileUseCase({
    required this.perfilRepository,
  });
  
  Future<Either<Failure,PacienteEntity>> call() async {
    return await perfilRepository.getPerfil();
  }
}
