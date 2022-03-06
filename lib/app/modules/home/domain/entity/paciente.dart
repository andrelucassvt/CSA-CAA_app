import 'package:projeto_csa_app/app/modules/home/domain/entity/interacao.dart';
import 'package:projeto_csa_app/app/modules/home/domain/interface/dados_semelhantes_card_grid_interface.dart';

class PacienteEntity implements DadosSemelhantesCardGridInterface{

  String? nome;
  String? cpf;
  String? medico;
  String? foto;
  String? sexo;
  String? responsavel;
  List<InteracaoEntity>? interacoes;

  PacienteEntity({
    this.nome,
    this.cpf,
    this.medico,
    this.foto,
    this.sexo,
    this.responsavel,
    this.interacoes,
  });

  @override
  String get fotoCard => foto ?? "";

  @override
  String get nomeCard => nome!;
}
