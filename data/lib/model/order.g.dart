// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserOrderEntityAdapter extends TypeAdapter<UserOrderEntity> {
  @override
  final int typeId = 3;

  @override
  UserOrderEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserOrderEntity(
      id: fields[0] as String,
      products: (fields[1] as List).cast<ProductModel>(),
      date: fields[2] as String,
      price: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, UserOrderEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.products)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserOrderEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
