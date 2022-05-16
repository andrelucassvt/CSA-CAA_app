import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/medico.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/domain/repository/perfil_web_repository.dart';

class GetPerfilWebUsecase {
  final PerfilWebRepository perfilWebRepository;
  GetPerfilWebUsecase({required this.perfilWebRepository});

  Future<Either<Failure, MedicoEntity>> call() async {
    return await perfilWebRepository.getPerfil();
  }
}