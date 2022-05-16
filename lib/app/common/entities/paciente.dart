
import 'package:projeto_csa_app/app/common/interface/dados_semelhantes_card_grid_interface.dart';

class PacienteEntity implements DadosSemelhantesCardGridInterface{

  String? nome;
  String? cpf;
  String? medico;
  String? foto;
  String? sexo;
  String? responsavel;
  String? fase;
  List<int>? idInteracoes;

  PacienteEntity({
    this.nome,
    this.cpf,
    this.medico,
    this.foto,
    this.sexo,
    this.responsavel,
    this.idInteracoes,
    this.fase,
  });

  PacienteEntity copyWith({
    String? nome,
    String? cpf,
    String? medico,
    String? foto,
    String? sexo,
    String? responsavel,
    String? fase,
    List<int>? idInteracoes,
  }) {
    return PacienteEntity(
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      medico: medico ?? this.medico,
      foto: foto ?? this.foto,
      sexo: sexo ?? this.sexo,
      responsavel: responsavel ?? this.responsavel,
      fase: fase ?? this.fase,
      idInteracoes: idInteracoes ?? this.idInteracoes,
    );
  }

  @override
  String get fotoCard => foto ?? "";

  @override
  String get nomeCard => nome!;
}
