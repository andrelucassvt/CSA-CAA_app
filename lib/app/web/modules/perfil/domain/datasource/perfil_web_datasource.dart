import 'package:projeto_csa_app/app/common/entities/medico.dart';

abstract class PerfilWebDatasource {
  Future<MedicoEntity> getPerfil();
}