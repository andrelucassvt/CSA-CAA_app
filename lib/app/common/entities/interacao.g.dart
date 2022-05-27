// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interacao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InteracaoEntityAdapter extends TypeAdapter<InteracaoEntity> {
  @override
  final int typeId = 0;

  @override
  InteracaoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InteracaoEntity(
      id: fields[0] as int?,
      nome: fields[1] as String?,
      foto: fields[2] as String?,
      isSelect: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, InteracaoEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.foto)
      ..writeByte(3)
      ..write(obj.isSelect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InteracaoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
