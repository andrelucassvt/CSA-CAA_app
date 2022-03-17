import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/datasource/login_datasource.dart';
import 'package:projeto_csa_app/app/shared/error/common_errors.dart';
import 'package:projeto_csa_app/app/shared/interceptors/dio_builder.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final DioBuilder dioBuilder;
  LoginDatasourceImpl(this.dioBuilder);

  @override
  Future<void> loginMedico({required String email, required String senha}) async {
    try {
      final Dio dio = await dioBuilder.getDiobaseResquestPublic();
      var response = await dio.post("/doctorLogin", data: {
        "cpf": email,
        "password": senha
      });
      await dioBuilder.saveKeys.saveToken(response.data["token"]["tokenHash"]);
      await dioBuilder.saveKeys.saveInfoUser(json.encode(response.data["doctor"]));
    } on DioError catch (e,s) {
      if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout) {
        throw CommonNoInternetConnectionError();
      }
      if (e.response?.statusCode == 404) {
        throw CommonNoDataFoundError();
      }
      throw CommonDesconhecidoError(message: e.message,stack: s);
    }
  }

  @override
  Future<void> loginPaciente(String cpf) async {
    try {
      final Dio dio = await dioBuilder.getDiobaseResquestPublic();
      final response =  await dio.get('/patient',queryParameters: {
        "cpf": cpf
      });
/*       await dioBuilder.saveKeys.saveToken(response.data["token"]["tokenHash"]);
      await dioBuilder.saveKeys.saveInfoUser(json.encode(response.data["doctor"])); */
    } on DioError catch (e,s) {
      if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout) {
        throw CommonNoInternetConnectionError();
      }
      if (e.response?.statusCode == 404) {
        throw CommonNoDataFoundError(message: "Usuário não encontrado");
      }
      throw CommonDesconhecidoError(message: e.message,stack: s);
    }
  }
}