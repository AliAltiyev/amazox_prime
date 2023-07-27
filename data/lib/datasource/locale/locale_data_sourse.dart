import 'package:data/data.dart';

abstract class LocaleDataSource {
  //!Theme
  Future<void> saveAppTheme(bool isDark);

  Future<bool> getAppTheme(String key);

  //!Cart
  Future<void> addCartItem(ProductModel model);

  Future<void> removeCartItem(ProductModel model);

  List<ProductModel> getAllCartItems();

  Future<void> removeAllCartItems();

  //!Products

  Future<void> addProducts(List<ProductModel> products);

  List<ProductModel> getAllProdducts();

  Future<ProductModel> getProductById(int productId);

  //!FontSize
  Future<void> saveFontSize(FontSizeModel model);

  FontSizeModel getFontSize();
}
