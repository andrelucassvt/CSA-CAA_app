import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/repository/home_web_repository.dart';

class GetInteracoesDoPacienteUsecase {

  final HomeWebRepository homeWebRepository;
  GetInteracoesDoPacienteUsecase(this.homeWebRepository);

  Future<Either<Failure,List<InteracaoEntity>>> call({String? cpf}) async {
    return await homeWebRepository.getInteracoesDoPaciente(cpf: cpf);
  }

}