import 'package:data/data.dart';

abstract class RemoteOrderDataSource {
  Future<void> saveOrderToFirebase(UserOrderEntity order);
  Future<List<int>> getOrdersPerDay();
}
