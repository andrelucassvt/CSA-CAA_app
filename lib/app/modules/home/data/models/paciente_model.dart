import 'package:projeto_csa_app/app/modules/home/data/models/interacoes_model.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';

class PacienteModel extends PacienteEntity {
  String? nome;
  String? cpf;
  String? medico;
  String? foto;
  String? sexo;
  String? responsavel;
  List<InteracaoEntity>? interacoes;
  
  PacienteModel({
    this.nome,
    this.cpf,
    this.medico,
    this.foto,
    this.sexo,
    this.responsavel,
    this.interacoes,
  });


  factory PacienteModel.fromMap(Map<String, dynamic> map) {
    return PacienteModel(
      nome: map['name'],
      cpf: map['cpf'],
      medico: map['doctorName'],
      foto: map['foto'],
      sexo: map['gender'],
      responsavel: map['responsibleName'],
      interacoes: map['interacoes'] != null ? List<InteracaoEntity>.from(map['interacoes']?.map((x) => InteracoesModel.fromJson(x))) : null,
    );
  }

  static List<PacienteModel> fromJsonList(List lista){
    if (lista.isEmpty) {
      return [];
    }
    return lista.map((e) => PacienteModel.fromMap(e)).toList();
  }
}
