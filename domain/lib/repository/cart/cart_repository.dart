import 'package:domain/domain.dart';

abstract class CartRepository {
  List<Product> getCartAllCartItems();
  Future<void> addCartItem(Product product);
  Future<void> removeCartItem(Product product);
  Future<void> removeAllCartItems();
}
