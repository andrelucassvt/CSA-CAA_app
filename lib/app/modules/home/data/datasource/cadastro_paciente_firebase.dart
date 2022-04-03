import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_csa_app/app/modules/home/data/models/interacoes_model.dart';
import 'package:projeto_csa_app/app/modules/home/data/models/paciente_model.dart';
import 'package:projeto_csa_app/app/modules/home/domain/datasource/cadastro_paciente_datasource.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/shared/interceptors/dio_builder.dart';

class CadastroPacienteDatasourceFirebase implements CadastroPacienteDatasource {
  final DioBuilder dioBuilder;
  CadastroPacienteDatasourceFirebase(this.dioBuilder);
  @override
  Future<void> cadastroDePaciente(PacienteEntity pacienteEntity) async {
    String emailMedico = await dioBuilder.saveKeys.getInfoUser();
    await FirebaseFirestore.instance.collection('pacientes').doc(pacienteEntity.cpf).set(PacienteModel.toJson(pacienteEntity.copyWith(medico: emailMedico)));
  }

  @override
  Future<List<InteracaoEntity>> getAllInteracoes(PacienteEntity pacienteEntity) async {
    final result = await FirebaseFirestore.instance.collection('interacoes').doc('fases').collection(pacienteEntity.fase!).get();
    final List<dynamic> interacoes = result.docs.map((doc) => InteracoesModel.fromJson(doc.data())).toList();
    return interacoes as List<InteracaoEntity>;
  }
  
}