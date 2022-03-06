import 'package:projeto_csa_app/app/modules/home/domain/interface/dados_semelhantes_card_grid_interface.dart';

class InteracaoEntity implements DadosSemelhantesCardGridInterface{

  String? nome;
  String? foto;

  InteracaoEntity({
    this.nome,
    this.foto,
  });

  @override
  String get fotoCard => foto!;

  @override
  String get nomeCard => nome!;
}
