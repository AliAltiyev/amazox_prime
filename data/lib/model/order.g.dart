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
    final int numOfFields = reader.readByte();
    final Map<int, dynamic> fields = <int, dynamic>{
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOrderEntity _$UserOrderEntityFromJson(Map<String, dynamic> json) =>
    UserOrderEntity(
      id: json['id'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$UserOrderEntityToJson(UserOrderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'products': instance.products,
      'date': instance.date,
      'price': instance.price,
    };
