import 'package:projeto_csa_app/app/modules/home/domain/interface/dados_semelhantes_card_grid_interface.dart';

class InteracaoEntity implements DadosSemelhantesCardGridInterface{

  int? id;
  String? nome;
  String? foto;
  bool isSelect;

  InteracaoEntity({
    this.id,
    this.nome,
    this.foto,
    this.isSelect = false,
  });

  InteracaoEntity copyWith({
    int? id,
    String? nome,
    String? foto,
    bool isSelect = false,
  }) {
    return InteracaoEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      foto: foto ?? this.foto,
      isSelect: isSelect,
    );
  }
  @override
  String get fotoCard => foto!;

  @override
  String get nomeCard => nome!;
}
