import 'package:data/data.dart';
import 'package:data/model/order.dart';

class OrderRepositoryImpl extends OrderRepository {
  final LocaleDataSource _localeDataSource;

  OrderRepositoryImpl(
    this._localeDataSource,
  );

  @override
  List<UserOrder> getAllOrders() {
    return _localeDataSource
        .getAllOrders()
        .map<UserOrder>((UserOrderEntity e) => OrderMapper.toDomain(e))
        .toList();
  }

  @override
  Future<void> saveOrder(UserOrder userOrder) async {
    return _localeDataSource.addOrder(OrderMapper.toModel(userOrder));
  }
}
