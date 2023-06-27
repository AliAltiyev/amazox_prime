import 'package:data/model/product.dart';
import 'package:domain/entity/product.dart';

abstract class ProductMapper {
  static toModel(Product model) {
    return ProductModel(model.name, model.description, model.image, model.price,
        model.ml, model.id);
  }

  static toEntity(ProductModel model) {
    return Product(
        name: model.name,
        description: model.description,
        image: model.image,
        price: model.price,
        ml: model.ml,
        id: model.id);
  }
}
