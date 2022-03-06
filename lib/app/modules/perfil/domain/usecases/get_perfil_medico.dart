import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/medico.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/repository/perfil_repository.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

class GetPerfilMedicoUsecase {
  final PerfilRepository perfilRepository;
  GetPerfilMedicoUsecase({
    required this.perfilRepository,
  });
  
  Future<Either<Failure,MedicoEntity>> call() async {
    return await perfilRepository.getPerfilMedico();
  }
}
