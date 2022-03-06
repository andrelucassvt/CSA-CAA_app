import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/infra/datasource/home_datasource.dart';

class HomeDatasourceImpl implements HomeDatasource{
  
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
    ];
  }

  @override
  Future<List<PacienteEntity>> getPacientes() async {
    return [
      PacienteEntity(
        nome: 'André Lucas'
      ),
      PacienteEntity(
        nome: 'André Lucas'
      ),
      PacienteEntity(
        nome: 'André Lucas'
      ),
      PacienteEntity(
        nome: 'André Lucas'
      ),
      PacienteEntity(
        nome: 'André Lucas'
      ),
    ];
  }
  
}