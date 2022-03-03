import 'package:projeto_csa_app/app/modules/home/domain/entity/medico.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';

abstract class PerfilDatasource {
  Future<Paciente> getPerfilPaciente();
  Future<Medico> getPerfilMedico();
}