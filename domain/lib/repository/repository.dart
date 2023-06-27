import 'package:domain/entity/product.dart';

abstract class Repository {
  Future<List<Product>> getProducts();
}
