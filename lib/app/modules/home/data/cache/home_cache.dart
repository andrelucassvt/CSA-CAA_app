import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';

abstract class HomeCache {
  Future<void> saveCache();
  Future<List<InteracaoEntity>> getCache();
}