import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';

abstract class CadastroPacienteDatasource {
  Future<void> cadastroDePaciente(PacienteEntity pacienteEntity);
  Future<List<InteracaoEntity>> getAllInteracoes(PacienteEntity pacienteEntity);
}