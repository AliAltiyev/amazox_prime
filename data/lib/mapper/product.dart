import 'package:data/data.dart';

abstract class ProductMapper {
  static ProductModel toModel(Product model) {
    return ProductModel(
      model.name,
      model.description,
      model.image,
      model.price,
      model.ml,
      model.id,
      model.bigDescription,
      model.rate,
    );
  }

  static Product toEntity(ProductModel model) {
    return Product(
      name: model.name,
      description: model.description,
      image: model.image,
      price: model.price,
      ml: model.ml,
      id: model.id,
      bigDescription: model.bigDescription,
      rate: model.rate,
    );
  }
}
