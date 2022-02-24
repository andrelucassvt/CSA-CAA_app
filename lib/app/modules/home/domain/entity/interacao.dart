import 'package:projeto_csa_app/app/modules/home/domain/interface/dados_semelhantes_card_grid_interface.dart';

class Interacao implements DadosSemelhantesCardGridInterface{

  String? nome;
  String? foto;

  Interacao({
    this.nome,
    this.foto,
  });

  @override
  String get fotoCard => foto!;

  @override
  String get nomeCard => nome!;
}
