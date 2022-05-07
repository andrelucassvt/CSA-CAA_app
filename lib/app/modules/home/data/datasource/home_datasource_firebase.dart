import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_csa_app/app/modules/home/data/models/interacoes_model.dart';
import 'package:projeto_csa_app/app/modules/home/data/models/paciente_model.dart';
import 'package:projeto_csa_app/app/modules/home/domain/datasource/home_datasource.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/shared/common/error/common_errors.dart';
import 'package:projeto_csa_app/app/shared/database/manager_keys.dart';

class HomeDataSourceFirebase implements HomeDatasource {
  final ManagerKeys managerKeys;
  HomeDataSourceFirebase(this.managerKeys);

  @override
  Future<List<InteracaoEntity>> getInteracoesDoPaciente({String? cpf}) async {
    try {
      String info = await managerKeys.getInfoUser();
      PacienteEntity? pacienteEntity; 
      if(!kIsWeb) pacienteEntity = PacienteModel.fromMap(json.decode(info));
      var result = await FirebaseFirestore.instance.collection('pacientes').doc(cpf ?? pacienteEntity?.cpf).get();
      if (result.exists) {
        final paciente = PacienteModel.fromMap(result.data()!);
        return FirebaseFirestore.instance.collection('interacoes').doc('fases').collection(paciente.fase!).get().then((fases) {
          final interacoes = fases.docs.map((value) => InteracoesModel.fromJson(value.data())).toList();
          final resultadoFinal = interacoes.where((element) => paciente.idInteracoes!.contains(element.id!)).toList();
          return resultadoFinal;
        });
      }
      return [];
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }

  @override
  Future<List<PacienteEntity>> getPacientes() async {
    try {
      String infoMedico = await managerKeys.getInfoUser();
      final result = await FirebaseFirestore.instance.collection('pacientes').get();
      var data = result.docs.map((value) => PacienteModel.fromMap(value.data())).toList();
      return data.where((element) => element.medico == infoMedico).toList();
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}