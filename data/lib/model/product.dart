import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel(
      this.name, this.description, this.image, this.price, this.ml, this.id);

  final String name;
  final String description;
  final String image;
  final int price;
  final int ml;
  final int id;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  Map<String, dynamic> toJson(ProductModel productModel) {
    return _$ProductModelToJson(productModel);
  }
}
