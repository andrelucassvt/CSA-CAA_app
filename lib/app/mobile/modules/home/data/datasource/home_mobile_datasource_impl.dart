import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_csa_app/app/common/entities/interacao.dart';
import 'package:projeto_csa_app/app/common/entities/paciente.dart';
import 'package:projeto_csa_app/app/common/error/common_errors.dart';
import 'package:projeto_csa_app/app/common/models/interacoes_model.dart';
import 'package:projeto_csa_app/app/common/models/paciente_model.dart';

import 'package:projeto_csa_app/app/mobile/modules/home/domain/datasource/home_mobile_datasource.dart';
import 'package:projeto_csa_app/app/common/database/manager_keys.dart';
class HomeMobileDataSourceImpl implements HomeMobileDataSource {

  final ManagerKeys managerKeys;
  HomeMobileDataSourceImpl({
    required this.managerKeys,
  });

  @override
  Future<List<InteracaoEntity>> getInteracoesDoPaciente() async {
    try {
      String info = await managerKeys.getInfoUser();
      PacienteEntity pacienteEntity = PacienteModel.fromMap(json.decode(info));
      var result = await FirebaseFirestore.instance.collection('pacientes').doc(pacienteEntity.cpf).get();
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
  
}
