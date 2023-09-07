import 'package:data/data.dart';
import 'package:data/model/order.dart';

abstract class LocaleDataSource {
  //init
  Future<void> initBox();
  //!Order
  Future<void> addOrder(UserOrderEntity orderModel);

  List<UserOrderEntity> getAllOrders();

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

  List<ProductModel> getAllProducts();

  Future<ProductModel> getProductById(int productId);

  //!FontSize
  Future<void> saveFontSize(FontSizeModel model);

  FontSizeModel getFontSize();
}
