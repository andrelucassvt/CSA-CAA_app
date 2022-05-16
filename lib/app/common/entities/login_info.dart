import 'dart:convert';

class LoginInfo {
  String? cpf;
  String? nome;
  LoginInfo({
    this.cpf,
    this.nome,
  });

  factory LoginInfo.fromMap(Map<String, dynamic> map) {
    return LoginInfo(
      cpf: map['cpf'],
      nome: map['nome'],
    );
  }
  factory LoginInfo.fromJson(String source) => LoginInfo.fromMap(json.decode(source));
}
