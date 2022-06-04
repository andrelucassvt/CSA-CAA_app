import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';

abstract class HomeWebDatasource {
  Future<List<InteracaoEntity>> getInteracoesDoPaciente({String? cpf});
  Future<List<PacienteEntity>> getPacientes();

  Future<void> cadastroDePaciente(PacienteEntity pacienteEntity);
  Future<void> atualizarInteracoesPaciente({required PacienteEntity pacienteEntity, required List<int> idInteracoes});
  Future<List<InteracaoEntity>> getAllInteracoes(PacienteEntity pacienteEntity);
}