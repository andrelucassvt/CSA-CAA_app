import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';

class Paciente {

  String? nome;
  String? cpf;
  String? laudoMedico;
  String? foto;
  String? sexo;
  List<Interacao>? interacoes;

  Paciente({
    this.nome,
    this.cpf,
    this.laudoMedico,
    this.foto,
    this.sexo,
    this.interacoes
  });
}
