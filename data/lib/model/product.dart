import 'package:data/data.dart';

part 'product.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final int price;
  @HiveField(4)
  final int ml;
  @HiveField(5)
  final int id;
  @HiveField(6)
  final String bigDescription;
  @HiveField(7)
  final int rate;

  ProductModel(
    this.name,
    this.description,
    this.image,
    this.price,
    this.ml,
    this.id,
    this.bigDescription,
    this.rate,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductModelToJson(this);
  }
}
