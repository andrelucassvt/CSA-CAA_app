import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/repository/cadastro_paciente_repository.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

class GetAllInteracoesUsecase {
  final CadastroPacienteRepository cadastroPacienteRepository;
  GetAllInteracoesUsecase(this.cadastroPacienteRepository);

  Future<Either<Failure, List<InteracaoEntity>>> call() async {
    return cadastroPacienteRepository.getAllInteracoes();
  }
}