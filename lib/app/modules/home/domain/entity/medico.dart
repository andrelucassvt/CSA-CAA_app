import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';

class MedicoEntity {

  String? nome;
  String? cpf;
  String? afiliacao;
	String? email;
	String? phone;

  MedicoEntity({
    this.nome,
    this.cpf,
    this.afiliacao,
    this.email,
    this.phone,
  });
}
