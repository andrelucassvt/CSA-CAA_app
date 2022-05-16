import 'package:projeto_csa_app/app/common/entities/paciente.dart';

abstract class PerfilMobileDatasource {
  Future<PacienteEntity> getPerfil();
}