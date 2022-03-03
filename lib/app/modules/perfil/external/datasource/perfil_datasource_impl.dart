import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/medico.dart';
import 'package:projeto_csa_app/app/modules/perfil/infra/datasource/perfil_datasource.dart';

class PerfilDatasourceImpl implements PerfilDatasource {

  @override
  Future<Medico> getPerfilMedico() async {
    return Medico(
      nome: 'Dr. Bernardo',
      hospital: 'Hospital amazonia'
    );
  }

  @override
  Future<Paciente> getPerfilPaciente() async {
    return Paciente(
      nome: 'André Lucas Barbosa Salvador',
      responsavel: 'Tatiane Almeida Barbosa',
      medico: 'Dr. Bernardo'
    );
  }
  
}