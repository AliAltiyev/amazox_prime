// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'font_size.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FontSizeModelAdapter extends TypeAdapter<FontSizeModel> {
  @override
  final int typeId = 2;

  @override
  FontSizeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FontSizeModel(
      fontSize: fields[0] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FontSizeModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.fontSize);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FontSizeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
