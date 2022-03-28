import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';

abstract class HomeDatasource {
  Future<List<InteracaoEntity>> getInteracoesDoPaciente({String? cpf});
  Future<List<PacienteEntity>> getPacientes();
}