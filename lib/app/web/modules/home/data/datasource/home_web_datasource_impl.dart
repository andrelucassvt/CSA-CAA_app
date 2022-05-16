import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_csa_app/app/common/database/manager_keys.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/common_errors.dart';
import 'package:projeto_csa_app/app/common/models/interacoes_model.dart';
import 'package:projeto_csa_app/app/common/models/paciente_model.dart';
import 'package:projeto_csa_app/app/web/modules/home/domain/datasource/home_web_datasource.dart';

class HomeWebDatasourceImpl implements HomeWebDatasource {

  final ManagerKeys managerKeys;
  HomeWebDatasourceImpl(this.managerKeys);

  @override
  Future<void> cadastroDePaciente(PacienteEntity pacienteEntity) async {
    String emailMedico = await managerKeys.getInfoUser();
    await FirebaseFirestore.instance.collection('pacientes').doc(pacienteEntity.cpf).set(PacienteModel.toJson(pacienteEntity.copyWith(medico: emailMedico)));
  }

  @override
  Future<List<InteracaoEntity>> getAllInteracoes(PacienteEntity pacienteEntity) async {
    final result = await FirebaseFirestore.instance.collection('interacoes').doc('fases').collection(pacienteEntity.fase!).get();
    final List<dynamic> interacoes = result.docs.map((doc) => InteracoesModel.fromJson(doc.data())).toList();
    return interacoes as List<InteracaoEntity>;
  }

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