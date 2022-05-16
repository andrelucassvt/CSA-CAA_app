
import 'package:projeto_csa_app/app/common/entities/interacao.dart';

class InteracoesModel extends InteracaoEntity {
  
  InteracoesModel({
    int? id,
    String? nome,
    String? foto,
    bool isSelect = false,
  }) : super(
    id: id,
    nome: nome,
    foto: foto,
    isSelect: isSelect,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'foto': foto,
    };
  }

  factory InteracoesModel.fromJson(Map<String, dynamic> map) {
    return InteracoesModel(
      id: map['id'],
      nome: map['nome'],
      foto: map['foto'],
    );
  }
  static List<InteracoesModel> fromJsonList(List lista){
    if (lista.isEmpty) {
      return [];
    }
    return lista.map((e) => InteracoesModel.fromJson(e)).toList();
  }
}
