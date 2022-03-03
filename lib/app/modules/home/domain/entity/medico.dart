import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';

class Medico {

  String? nome;
  String? cpf;
  String? cargo;
  String? foto;
  String? sexo;
  String? hospital;
  List<Paciente>? pacientes;

  Medico({
    this.nome,
    this.cpf,
    this.cargo,
    this.foto,
    this.sexo,
    this.hospital,
    this.pacientes
  });
}
