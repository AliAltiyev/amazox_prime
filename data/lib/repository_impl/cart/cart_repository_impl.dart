import 'package:data/data.dart';

final class CartRepossitoryImpl extends CartRepository {
  final LocaleDataSource _localeStorage;

  CartRepossitoryImpl({
    required LocaleDataSource localeStorage,
  }) : _localeStorage = localeStorage;

  @override
  Future<void> addCartItem(Product product) async {
    await _localeStorage.addCartItem(ProductMapper.toModel(product));
  }

  @override
  List<Product> getCartAllCartItems() {
    final List<ProductModel> cartItems = _localeStorage.getAllCartItems();
    return cartItems.map((product) => ProductMapper.toEntity(product)).toList();
  }

  @override
  Future<void> removeAllCartItems() async {
    await _localeStorage.removeAllCartItems();
  }

  @override
  Future<void> removeCartItem(Product product) async {
    await _localeStorage.removeCartItem(ProductMapper.toModel(product));
  }
}
