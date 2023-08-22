import 'package:data/data.dart';
import 'package:data/model/order.dart';

final class LocaleDataSourceImpl extends LocaleDataSource {
  late Box<ProductModel> _cartBox;
  late Box<ProductModel> _products;
  late Box<FontSizeModel> _font;
  late Box<bool> _theme;
  late Box<UserOrderEntity> _order;

  @override
  Future<void> initBox() async {
    _cartBox = await Hive.openBox<ProductModel>(LocaleStorage.cart.name);
    _products = await Hive.openBox<ProductModel>(LocaleStorage.products.name);
    _font = await Hive.openBox<FontSizeModel>(LocaleStorage.font.name);
    _theme = await Hive.openBox<bool>(LocaleStorage.theme.name);
    _order = await Hive.openBox<UserOrderEntity>(LocaleStorage.order.name);
  }

  @override
  Future<void> saveAppTheme(bool isDark) async {
    await _theme.put(
      LocaleStorage.key.name,
      isDark,
    );
  }

  @override
  Future<bool> getAppTheme(String key) async {
    return _theme.get(key) ?? false;
  }

  //!Cart
  @override
  Future<void> addCartItem(ProductModel model) async {
    await _cartBox.put(model.id, model);
  }

  @override
  List<ProductModel> getAllCartItems() {
    return _cartBox.values.toList();
  }

  @override
  Future<void> removeAllCartItems() async {
    await _cartBox.clear();
  }

  @override
  Future<void> removeCartItem(ProductModel model) async {
    await _cartBox.delete(model.id);
  }

  @override
  Future<void> addProducts(List<ProductModel> products) async {
    await _products.addAll(products);
  }

  @override
  List<ProductModel> getAllProducts() {
    return _products.values.toList();
  }

  @override
  Future<ProductModel> getProductById(int productId) async {
    return _products.getAt(productId)!;
  }

  //!Font
  @override
  FontSizeModel getFontSize() {
    return _font.values.last;
  }

  @override
  Future<void> saveFontSize(FontSizeModel model) async {
    await _font.add(model);
  }

  @override
  Future<void> addOrder(UserOrderEntity orderModel) async {
    await _order.add(orderModel);
  }

  @override
  List<UserOrderEntity> getAllOrders() {
    return _order.values.toList();
  }
}
