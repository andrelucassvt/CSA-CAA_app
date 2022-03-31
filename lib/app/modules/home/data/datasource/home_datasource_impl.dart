
import 'package:dio/dio.dart';
import 'package:projeto_csa_app/app/modules/home/data/models/interacoes_model.dart';

import 'package:projeto_csa_app/app/modules/home/data/models/paciente_model.dart';
import 'package:projeto_csa_app/app/modules/home/domain/datasource/home_datasource.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/shared/common/error/common_errors.dart';
import 'package:projeto_csa_app/app/shared/interceptors/dio_builder.dart';
import 'package:projeto_csa_app/app/shared/login_info/login_info.dart';

class HomeDatasourceImpl implements HomeDatasource {
  final DioBuilder dioBuilder;
  HomeDatasourceImpl(this.dioBuilder);
  
  @override
  Future<List<InteracaoEntity>> getInteracoesDoPaciente({String? cpf}) async {
    try {
      Dio dio = await dioBuilder.getDiobaseResquestPublic();
      var infoUser = await dioBuilder.saveKeys.getInfoUser();
      LoginInfo user = LoginInfo.fromJson(infoUser);
      var response = await dio.get(
        '/hasInteraction',
        queryParameters: {
          'cpf': cpf ?? user.cpf,
        }
      );
      return InteracoesModel.fromJsonList(response.data);
    } on DioError catch (e,s) {
      if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout) {
        throw CommonNoInternetConnectionError();
      }
      if (e.response?.statusCode == 404) {
        throw CommonNoDataFoundError(message: e.message);
      }
      throw CommonDesconhecidoError(message: e.message,stack: s);
    }
  }

  @override
  Future<List<PacienteEntity>> getPacientes() async {
    try {
      final Dio dio = await dioBuilder.getDiobaseResquestPrivate();
      var infoUser = await dioBuilder.saveKeys.getInfoUser();
      LoginInfo user = LoginInfo.fromJson(infoUser);

      var response = await dio.get('/auth/patients',queryParameters: {
        "doctorCpf": user.cpf
      });
      return PacienteModel.fromJsonList(response.data);
    } on DioError catch (e,s) {
      if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout) {
        throw CommonNoInternetConnectionError();
      }
      throw CommonDesconhecidoError(message: e.message,stack: s);
    }
  }
  
}