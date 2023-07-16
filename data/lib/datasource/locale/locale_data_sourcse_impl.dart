import 'package:data/data.dart';

final class LocaleDataSourseImpl extends LocaleDataSource {
  final Box<ProductModel> _cartBox = Hive.box(LocaleStorage.cart.name);

  //!Theme
  @override
  Future<void> saveAppTheme(bool isDark) async {
    final box = await Hive.openBox(
      LocaleStorage.theme.name,
    );
    await box.put(
      LocaleStorage.key.name,
      isDark,
    );
  }

  @override
  Future<bool> getAppTheme(String key) async {
    final box = await Hive.openBox(
      LocaleStorage.theme.name,
    );
    return box.get(key) ?? false;
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
}
