import 'package:data/data.dart';
import 'package:data/model/order.dart';

class OrderMapper {
  static UserOrder toDomain(UserOrderModel userOrderModel) {
    return UserOrder(
      id: userOrderModel.id,
      dateTime: userOrderModel.dateTime,
      products: userOrderModel.products
          .map((e) => ProductMapper.toEntity(e))
          .toList(),
      price: userOrderModel.price,
    );
  }

  static UserOrderModel toModel(UserOrder userOrder) {
    return UserOrderModel(
      id: userOrder.id,
      dateTime: userOrder.dateTime,
      products:
          userOrder.products.map((e) => ProductMapper.toModel(e)).toList(),
      price: userOrder.price,
    );
  }
}
