import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/failure.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/repository/home_web_repository.dart';

class AtualizarInteracoesPacienteUsecase {
  final HomeWebRepository homeWebRepository;
  AtualizarInteracoesPacienteUsecase(this.homeWebRepository);

   Future<Either<Failure, void>> call({required PacienteEntity pacienteEntity, required List<int> idInteracoes}) async {
    return await homeWebRepository.atualizarInteracoesPaciente(
      idInteracoes: idInteracoes,
      pacienteEntity: pacienteEntity,
    );
   }
}