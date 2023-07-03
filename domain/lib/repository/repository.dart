import 'package:domain/domain.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();

  Future<List<Menu>> fetchMenu();
}
