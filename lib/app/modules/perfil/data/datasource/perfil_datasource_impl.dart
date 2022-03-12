import 'package:dio/dio.dart';
import 'package:projeto_csa_app/app/modules/home/data/models/medico_model.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/medico.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/datasource/perfil_datasource.dart';
import 'package:projeto_csa_app/app/modules/perfil/domain/error/perfil_error.dart';
import 'package:projeto_csa_app/app/shared/database/manager_keys.dart';
import 'package:projeto_csa_app/app/shared/interceptors/dio_builder.dart';
import 'package:projeto_csa_app/app/shared/login_info/login_info.dart';

class PerfilDatasourceImpl implements PerfilDatasource {
  final DioBuilder dioBuilder;
  PerfilDatasourceImpl(this.dioBuilder);

  @override
  Future<MedicoEntity> getPerfilMedico() async {
    try {
      final Dio dio = await dioBuilder.getDiobaseResquestPublic();
      var infoUser = await dioBuilder.saveKeys.getInfoUser();
      LoginInfo user = LoginInfo.fromJson(infoUser);

      var response = await dio.get('/doctor',queryParameters: {
        "cpf": user.cpf
      });
      return MedicoModel.fromMap(response.data);
    } on DioError catch (e,s) {
      if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout) {
        throw PerfilNoInternetConnection();
      }
      throw PerfilUnkenError(message: e.message,stack: s);
    }
  }

  @override
  Future<PacienteEntity> getPerfilPaciente() async {
    return PacienteEntity(
      nome: 'André Lucas Barbosa Salvador',
      responsavel: 'Tatiane Almeida Barbosa',
      medico: 'Dr. Bernardo'
    );
  }
  
}