import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/interface/dados_semelhantes_card_grid_interface.dart';

class Paciente implements DadosSemelhantesCardGridInterface{

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

  @override
  String get fotoCard => foto ?? "";

  @override
  String get nomeCard => nome!;
}
