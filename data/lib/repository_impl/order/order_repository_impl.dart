import 'package:data/data.dart';

class OrderRepositoryImpl extends OrderRepository {
  final LocaleDataSource _localeDataSource;

  OrderRepositoryImpl(
    this._localeDataSource,
  );

  @override
  List<UserOrder> getAllOrders() {
    return _localeDataSource
        .getAllOrders()
        .map<UserOrder>(OrderMapper.toDomain)
        .toList();
  }

  @override
  Future<void> saveOrder(UserOrder userOrder) async {
    return _localeDataSource.addOrder(OrderMapper.toModel(userOrder));
  }
}
