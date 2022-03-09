import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:dartz/dartz.dart';
import 'package:projeto_csa_app/app/modules/home/domain/repository/cadastro_paciente_repository.dart';
import 'package:projeto_csa_app/app/modules/home/infra/datasource/cadastro_paciente_datasource.dart';
import 'package:projeto_csa_app/app/shared/error/failure.dart';

class CadastroPacienteRepositoryImpl implements CadastroPacienteRepository {
  final CadastroPacienteDatasource cadastroPacienteDatasource;
  CadastroPacienteRepositoryImpl(this.cadastroPacienteDatasource);


  @override
  Future<Either<Failure, void>> cadastroDePaciente(PacienteEntity pacienteEntity) async {
    try {
      var result = await cadastroPacienteDatasource.cadastroDePaciente(pacienteEntity);
      return Right(result);
    } on Failure catch (e) {
      throw Left(e);
    }
  }
  
}