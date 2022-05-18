import 'package:projeto_csa_app/app/common/entities/interacao.dart';

abstract class DataLocal {
  Future<List<InteracaoEntity>> getAll();
  Future<void> save(InteracaoEntity data);
  Future<void> delete(String id);
}