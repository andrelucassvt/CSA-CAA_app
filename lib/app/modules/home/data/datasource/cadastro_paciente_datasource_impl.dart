import 'package:projeto_csa_app/app/modules/home/domain/datasource/cadastro_paciente_datasource.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';

class CadastroPacienteDatasourceImpl implements CadastroPacienteDatasource{
  
  @override
  Future<void> cadastroDePaciente(PacienteEntity pacienteEntity) async {
 
  }

  @override
  Future<List<InteracaoEntity>> getAllInteracoes() {
    // TODO: implement getAllInteracoes
    throw UnimplementedError();
  }
  
}