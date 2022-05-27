
import 'package:hive/hive.dart';
import 'package:projeto_csa_app/app/common/interface/dados_semelhantes_card_grid_interface.dart';
part 'interacao.g.dart';

@HiveType(typeId: 0)
class InteracaoEntity implements DadosSemelhantesCardGridInterface{

  InteracaoEntity({
    this.id,
    this.nome,
    this.foto,
    this.isSelect = false,
  });

  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? nome;

  @HiveField(2)
  final String? foto;

  @HiveField(3)
  final bool isSelect;

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
