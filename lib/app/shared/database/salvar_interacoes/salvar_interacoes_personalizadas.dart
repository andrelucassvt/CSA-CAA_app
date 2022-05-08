import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';

abstract class SalvarInteracoesPersonalizadas {
  Future<void> salvarInteracoesPersonalizadas();
  Future<List<InteracaoEntity>> pegarInteracoesPersonalizadas();
}