import 'package:domain/domain.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
  Future<Product> fetchProductById(int productId);
}
