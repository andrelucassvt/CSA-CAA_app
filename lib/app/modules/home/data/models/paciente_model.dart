import 'package:projeto_csa_app/app/modules/home/domain/entity/paciente.dart';

class PacienteModel extends PacienteEntity {
  
  PacienteModel({
    String? nome,
    String? cpf,
    String? medico,
    String? foto,
    String? sexo,
    String? responsavel,
    String? fase,
    List<int>? interacoes,
  }) : super(
    nome: nome,
    cpf: cpf,
    medico: medico,
    foto: foto,
    sexo: sexo,
    responsavel: responsavel,
    fase: fase,
    idInteracoes: interacoes,
  );
   
   static Map<String,dynamic> toJson(PacienteEntity pacienteEntity){
    return {
      'nome': pacienteEntity.nome,
      'cpf': pacienteEntity.cpf,
      'medico': pacienteEntity.medico,
      'foto': pacienteEntity.foto,
      'sexo': pacienteEntity.sexo,
      'responsavel': pacienteEntity.responsavel,
      'fase': pacienteEntity.fase,
      'idInteracoes': pacienteEntity.idInteracoes,
    };
  }
  factory PacienteModel.fromMap(Map<String, dynamic> map) {
    return PacienteModel(
      nome: map['nome'],
      cpf: map['cpf'],
      medico: map['medico'],
      foto: map['foto'],
      sexo: map['sexo'],
      responsavel: map['responsavel'],
      fase: map['fase'],
      interacoes: map['idInteracoes'] != null ? List<int>.from(map['idInteracoes']) : null,
    );
  }

  static List<PacienteModel> fromJsonList(List lista){
    if (lista.isEmpty) {
      return [];
    }
    return lista.map((e) => PacienteModel.fromMap(e)).toList();
  }
}
