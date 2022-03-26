import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';

class InteracoesModel extends InteracaoEntity {
  
  
  InteracoesModel({
    this.nome,
    this.foto,
  });

  String? nome;
  String? foto;

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'foto': foto,
    };
  }

  factory InteracoesModel.fromJson(Map<String, dynamic> map) {
    return InteracoesModel(
      nome: map['name'],
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
