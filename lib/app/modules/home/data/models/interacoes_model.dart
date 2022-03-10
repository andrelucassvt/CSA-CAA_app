import 'dart:convert';

import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';

class InteracoesModel extends InteracaoEntity {
  
  String? nome;
  String? foto;
  
  InteracoesModel({
    this.nome,
    this.foto,
  });


  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'foto': foto,
    };
  }

  factory InteracoesModel.fromMap(Map<String, dynamic> map) {
    return InteracoesModel(
      nome: map['nome'],
      foto: map['foto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InteracoesModel.fromJson(String source) => InteracoesModel.fromMap(json.decode(source));
}
