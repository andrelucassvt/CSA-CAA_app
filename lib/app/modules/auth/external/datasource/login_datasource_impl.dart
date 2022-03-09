import 'package:dio/dio.dart';
import 'package:projeto_csa_app/app/modules/auth/domain/error/login_error.dart';
import 'package:projeto_csa_app/app/modules/auth/infra/datasource/login_datasource.dart';

class LoginDatasourceImpl implements LoginDatasource{
  final Dio dio;
  LoginDatasourceImpl(this.dio);

  @override
  Future<void> loginMedico({required String email, required String senha}) async {
    try {
      
    } on DioError catch (e,s) {
      if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout) {
        throw LoginNoInternetConnection();
      }
      throw LoginUnkenError(message: e.message,stack: s);
    }
  }

  @override
  Future<void> loginPaciente(String cpf) async {
    try {
      
    } on DioError catch (e,s) {
      if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout) {
        throw LoginNoInternetConnection();
      }
      throw LoginUnkenError(message: e.message,stack: s);
    }
  }
}