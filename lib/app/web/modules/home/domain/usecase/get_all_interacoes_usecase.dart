import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/repository/home_web_repository.dart';

class GetAllInteracoesUsecase {

  final HomeWebRepository homeWebRepository;
  GetAllInteracoesUsecase(this.homeWebRepository);

  Future<Either<Failure,List<InteracaoEntity>>> call(PacienteEntity pacienteEntity) async {
    return await homeWebRepository.getAllInteracoes(pacienteEntity);
  }
}