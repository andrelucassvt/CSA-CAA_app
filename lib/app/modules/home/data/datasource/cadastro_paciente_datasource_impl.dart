import 'package:dio/dio.dart';
import 'package:projeto_csa_app/app/modules/home/data/models/interacoes_model.dart';
import 'package:projeto_csa_app/app/modules/home/domain/datasource/cadastro_paciente_datasource.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/shared/error/common_errors.dart';
import 'package:projeto_csa_app/app/shared/interceptors/dio_builder.dart';

class CadastroPacienteDatasourceImpl implements CadastroPacienteDatasource{
  final DioBuilder dioBuilder;
  CadastroPacienteDatasourceImpl(this.dioBuilder);
  @override
  Future<void> cadastroDePaciente(PacienteEntity pacienteEntity) async {
    
  }
  
  @override
  Future<List<InteracaoEntity>> getAllInteracoes() async {
    try {
      Dio dio = await dioBuilder.getDiobaseResquestPublic();
      var response = await dio.get('/allInteractions');
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
  
}