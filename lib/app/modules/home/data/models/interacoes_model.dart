import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';

class InteracoesModel extends InteracaoEntity {
  
  
  InteracoesModel({
    this.id,
    this.nome,
    this.foto,
    this.isSelect = false,
  });
  final int? id;
  final String? nome;
  final String? foto;
  final bool isSelect;

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
