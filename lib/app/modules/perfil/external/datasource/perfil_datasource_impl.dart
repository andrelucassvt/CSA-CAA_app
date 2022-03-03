import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/medico.dart';
import 'package:projeto_csa_app/app/modules/perfil/infra/datasource/perfil_datasource.dart';

class PerfilDatasourceImpl implements PerfilDatasource {

  @override
  Future<Medico> getPerfilMedico() async {
    return Medico();
  }

  @override
  Future<Paciente> getPerfilPaciente() async {
    return Paciente();
  }
  
}