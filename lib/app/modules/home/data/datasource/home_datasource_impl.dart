import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:projeto_csa_app/app/modules/home/data/models/paciente_model.dart';
import 'package:projeto_csa_app/app/modules/home/domain/datasource/home_datasource.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/shared/database/manager_keys.dart';
import 'package:projeto_csa_app/app/shared/error/common_errors.dart';
import 'package:projeto_csa_app/app/shared/interceptors/dio_builder.dart';
import 'package:projeto_csa_app/app/shared/login_info/login_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDatasourceImpl implements HomeDatasource {
  final DioBuilder dioBuilder;
  HomeDatasourceImpl(this.dioBuilder);
  
  @override
  Future<List<InteracaoEntity>> getInteracoesDoPaciente() async {
    return [
      InteracaoEntity(
        nome: 'Quero dormir'
      ),
      InteracaoEntity(
        nome: 'Quero comer'
      ),
      InteracaoEntity(
        nome: 'Quero dormir'
      ),
      InteracaoEntity(
        nome: 'Quero dormir'
      ),
      InteracaoEntity(
        nome: 'Quero dormir'
      ),
      InteracaoEntity(
        nome: 'Quero dormir'
      ),
      InteracaoEntity(
        nome: 'Quero dormir'
      ),
      InteracaoEntity(
        nome: 'Quero dormir'
      ),
      InteracaoEntity(
        nome: 'Quero dormir'
      ),
      InteracaoEntity(
        nome: 'Quero dormir'
      ),
      InteracaoEntity(
        nome: 'Quero dormir'
      ),
      InteracaoEntity(
        nome: 'Quero dormir'
      ),
      InteracaoEntity(
        nome: 'Quero dormir'
      ),
      InteracaoEntity(
        nome: 'Quero dormir'
      ),
    ];
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