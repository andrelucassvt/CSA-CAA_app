import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/medico.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/datasource/perfil_datasource.dart';

class PerfilDatasourceImpl implements PerfilDatasource {

  @override
  Future<MedicoEntity> getPerfilMedico() async {
    return MedicoEntity(
      nome: 'Dr. Bernardo',
      hospital: 'Hospital amazonia'
    );
  }

  @override
  Future<PacienteEntity> getPerfilPaciente() async {
    return PacienteEntity(
      nome: 'André Lucas Barbosa Salvador',
      responsavel: 'Tatiane Almeida Barbosa',
      medico: 'Dr. Bernardo'
    );
  }
  
}