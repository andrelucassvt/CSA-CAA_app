import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_csa_app/app/modules/home/data/models/interacoes_model.dart';
import 'package:projeto_csa_app/app/modules/home/data/models/paciente_model.dart';
import 'package:projeto_csa_app/app/modules/home/domain/datasource/home_datasource.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/shared/common/error/common_errors.dart';

class HomeDataSourceFirebase implements HomeDatasource {


  @override
  Future<List<InteracaoEntity>> getInteracoesDoPaciente({String? cpf}) async {
    try {
      var result = await FirebaseFirestore.instance.collection('pacientes').doc(cpf ?? '21212121121').get();
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
    return [];
  }
}