import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_csa_app/app/modules/home/data/models/medico_model.dart';
import 'package:projeto_csa_app/app/modules/home/data/models/paciente_model.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/medico.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/datasource/perfil_datasource.dart';
import 'package:projeto_csa_app/app/shared/common/error/common_errors.dart';
import 'package:projeto_csa_app/app/shared/database/manager_keys.dart';

class PerfilDatasourceFirebase implements PerfilDatasource {
  final ManagerKeys managerKeys;
  PerfilDatasourceFirebase(this.managerKeys);
  
  @override
  Future<MedicoEntity> getPerfilMedico() async {
    try {
      String emailMedico = await managerKeys.getInfoUser();
      final result = await FirebaseFirestore.instance.collection('medicos').doc(emailMedico).get();
      return MedicoModel.fromMap(result.data()!);
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }

  @override
  Future<PacienteEntity> getPerfilPaciente() async {
    try {
      String data = await managerKeys.getInfoUser();
      PacienteEntity pacienteEntity = PacienteModel.fromMap(json.decode(data));
      return pacienteEntity;
    } on FirebaseException catch (e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }

}