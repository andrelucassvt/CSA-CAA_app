import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_csa_app/app/common/database/manager_keys.dart';
import 'package:projeto_csa_app/app/common/entities/medico.dart';
import 'package:projeto_csa_app/app/common/error/common_errors.dart';
import 'package:projeto_csa_app/app/common/models/medico_model.dart';
import 'package:projeto_csa_app/app/web/modules/perfil/domain/datasource/perfil_web_datasource.dart';

class PerfilWebDatasourceImpl implements PerfilWebDatasource {
  final ManagerKeys managerKeys;
  PerfilWebDatasourceImpl(this.managerKeys);

  @override
  Future<MedicoEntity> getPerfil() async {
    try {
      String emailMedico = await managerKeys.getInfoUser();
      final result = await FirebaseFirestore.instance.collection('medicos').doc(emailMedico).get();
      return MedicoModel.fromMap(result.data()!);
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }

}