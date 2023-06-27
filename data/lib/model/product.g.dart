// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      json['name'] as String,
      json['description'] as String,
      json['image'] as String,
      json['price'] as int,
      json['ml'] as int,
      json['id'] as int,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'ml': instance.ml,
      'id': instance.id,
    };
