import 'package:domain/entity/user_order.dart';

abstract class OrderRepository {
  Future<void> saveOrderLocale(UserOrder userOrder);
  Future<void> saveOrderToFirebase(UserOrder userOrder);
  List<UserOrder> getAllOrders();
}
