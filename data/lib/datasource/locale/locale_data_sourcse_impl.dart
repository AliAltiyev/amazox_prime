import 'package:core/exceptions/cache.dart';
import 'package:data/data.dart';

final class LocaleDataSourseImpl extends LocaleDataSource {
  final Box<ProductModel> _cartBox;
  final Box<ProductModel> _products;
  final Box<FontSizeModel> _font;
  final Box<bool> _theme;
  final Box<bool> _userStateBox;

  LocaleDataSourseImpl({
    required Box<ProductModel> cartBox,
    required Box<ProductModel> products,
    required Box<FontSizeModel> font,
    required Box<bool> theme,
    required Box<bool> userStateBox,
  })  : _cartBox = cartBox,
        _products = products,
        _font = font,
        _theme = theme,
        _userStateBox = userStateBox;

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
  List<ProductModel> getAllProdducts() {
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
  Future<void> cacheFirstTimer() async {
    try {
      await _userStateBox.put(LocaleStorage.userAuth.name, false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> checkIfUserIsFirstTimer() async {
    try {
      return _userStateBox.get(LocaleStorage.userAuth.name) ?? true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
