import 'package:dio/dio.dart';
import 'package:projeto_csa_app/app/shared/database/manager_keys.dart';

const urlBase = 'https://andre-tcc-node-api.herokuapp.com';

class DioBuilder {

  final ManagerKeys saveKeys;
  DioBuilder(this.saveKeys);

  Future<Dio> getDiobaseResquestPublic() async {
    return Dio(BaseOptions(
      baseUrl: urlBase,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        'Content-Type': 'application/json',
      }
    ));
  }
  Future<Dio> getDiobaseResquestPrivate() async {
    var token = await saveKeys.getToken();
    return Dio(BaseOptions(
      baseUrl: urlBase,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      }
    ));
  }

}