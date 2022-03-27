import 'package:projeto_csa_app/app/modules/home/domain/interface/dados_semelhantes_card_grid_interface.dart';

class PacienteEntity implements DadosSemelhantesCardGridInterface{

  String? nome;
  String? cpf;
  String? medico;
  String? foto;
  String? sexo;
  String? responsavel;
  List<int>? idInteracoes;

  PacienteEntity({
    this.nome,
    this.cpf,
    this.medico,
    this.foto,
    this.sexo,
    this.responsavel,
    this.idInteracoes,
  });

  PacienteEntity copyWith({
    String? nome,
    String? cpf,
    String? medico,
    String? foto,
    String? sexo,
    String? responsavel,
    List<int>? idInteracoes,
  }) {
    return PacienteEntity(
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      medico: medico ?? this.medico,
      foto: foto ?? this.foto,
      sexo: sexo ?? this.sexo,
      responsavel: responsavel ?? this.responsavel,
      idInteracoes: idInteracoes ?? this.idInteracoes,
    );
  }

  @override
  String get fotoCard => foto ?? "";

  @override
  String get nomeCard => nome!;
}
