import 'dart:convert';
import 'package:projeto_csa_app/app/modules/home/domain/entity/medico.dart';

class MedicoModel extends MedicoEntity {
  String? nome;
  String? cpf;
  String? afiliacao;
	String? email;
	String? phone;

  MedicoModel({
    this.nome,
    this.cpf,
    this.afiliacao,
    this.email,
    this.phone
  });

  factory MedicoModel.fromMap(Map<String, dynamic> map) {
    return MedicoModel(
      nome: map['name'],
      cpf: map['cpf'],
      afiliacao: map['affiliation'],
      email: map['email'],
      phone: map['phone']
    );
  }
  factory MedicoModel.fromJson(String source) => MedicoModel.fromMap(json.decode(source));
}