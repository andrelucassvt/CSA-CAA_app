import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projeto_csa_app/app/modules/home/data/models/medico_model.dart';
import 'package:projeto_csa_app/app/modules/home/data/models/paciente_model.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/medico.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/datasource/perfil_datasource.dart';
import 'package:projeto_csa_app/app/shared/common/error/common_errors.dart';
import 'package:projeto_csa_app/app/shared/interceptors/dio_builder.dart';

class PerfilDatasourceFirebase implements PerfilDatasource {
  final DioBuilder dioBuilder;
  PerfilDatasourceFirebase(this.dioBuilder);
  
  @override
  Future<MedicoEntity> getPerfilMedico() async {
    try {
      String emailMedico = await dioBuilder.saveKeys.getInfoUser();
      final result = await FirebaseFirestore.instance.collection('medicos').doc(emailMedico).get();
      return MedicoModel.fromMap(result.data()!);
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }

  @override
  Future<PacienteEntity> getPerfilPaciente() async {
    try {
      String data = await dioBuilder.saveKeys.getInfoUser();
      PacienteEntity pacienteEntity = PacienteModel.fromMap(json.decode(data));
      return pacienteEntity;
    } on FirebaseException catch (e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }

}