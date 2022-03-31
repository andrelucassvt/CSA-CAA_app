import 'package:dio/dio.dart';
import 'package:projeto_csa_app/app/shared/common/error/common_errors.dart';

abstract class CommonConvertThrow {
  exceptionConvert(DioError e, s) {
    if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout) {
      throw CommonNoInternetConnectionError();
    }
    if (e.response?.statusCode == 404) {
      throw CommonNoDataFoundError(message: e.message, stack: s);
    }
    throw CommonDesconhecidoError(message: e.message,stack: s);
  }
}