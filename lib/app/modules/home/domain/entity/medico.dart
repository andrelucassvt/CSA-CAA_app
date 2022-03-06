import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';

class MedicoEntity {

  String? nome;
  String? cpf;
  String? cargo;
  String? foto;
  String? sexo;
  String? hospital;
  List<PacienteEntity>? pacientes;

  MedicoEntity({
    this.nome,
    this.cpf,
    this.cargo,
    this.foto,
    this.sexo,
    this.hospital,
    this.pacientes
  });
}
