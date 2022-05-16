import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:projeto_csa_app/app/common/database/manager_keys.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/models/paciente_model.dart';
import 'package:projeto_csa_app/app/mobile/modules/perfil/domain/datasource/perfil_mobile_datasource.dart';
import 'package:projeto_csa_app/app/common/error/common_errors.dart';

class PerfilMobileDatasourceImpl implements PerfilMobileDatasource {

  final ManagerKeys managerKeys;
  PerfilMobileDatasourceImpl({
    required this.managerKeys,
  });

  @override
  Future<PacienteEntity> getPerfil() async {
    try {
      String data = await managerKeys.getInfoUser();
      PacienteEntity pacienteEntity = PacienteModel.fromMap(json.decode(data));
      return pacienteEntity;
    } on FirebaseException catch (e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }

}
