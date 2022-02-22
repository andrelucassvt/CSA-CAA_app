import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/infra/datasource/home_datasource.dart';

class HomeDatasourceImpl implements HomeDatasource{
  
  @override
  Future<List<Interacao>> getInteracoesDoPaciente() async {
    // TODO: implement getInteracoesDoPaciente
    throw UnimplementedError();
  }

  @override
  Future<List<Paciente>> getPacientes() async {
    // TODO: implement getPacientes
    throw UnimplementedError();
  }
  
}