import 'package:projeto_csa_app/app/common/entities/interacao.dart';

abstract class HomeMobileDataSource {
  Future<List<InteracaoEntity>> getInteracoesDoPaciente();
}