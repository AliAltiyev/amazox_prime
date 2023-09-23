import 'package:data/data.dart';

class OrderRepositoryImpl extends OrderRepository {
  final LocaleDataSource _localeDataSource;
  final RemoteOrderDataSource _remoteOrderDataSource;

  OrderRepositoryImpl(
    this._localeDataSource,
    this._remoteOrderDataSource,
  );

  @override
  List<UserOrder> getAllOrders() {
    return _localeDataSource
        .getAllOrders()
        .map<UserOrder>(OrderMapper.toDomain)
        .toList();
  }

  @override
  Future<void> saveOrderLocale(UserOrder userOrder) async {
    return _localeDataSource.addOrder(
      OrderMapper.toModel(userOrder),
    );
  }

  @override
  Future<void> saveOrderToFirebase(UserOrder userOrder) {
    return _remoteOrderDataSource.saveOrderToFirebase(
      OrderMapper.toModel(userOrder),
    );
  }
}
