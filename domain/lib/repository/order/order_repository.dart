import 'package:domain/entity/user_order.dart';

abstract class OrderRepository {
  Future<void> saveOrder(UserOrder userOrder);

  List<UserOrder> getAllOrders();
}
