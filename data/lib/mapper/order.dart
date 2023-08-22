import 'package:data/data.dart';
import 'package:data/model/order.dart';

class OrderMapper {
  static UserOrder toDomain(UserOrderEntity userOrderModel) {
    return UserOrder(
      id: userOrderModel.id,
      dateTime: userOrderModel.date,
      products: userOrderModel.products
          .map((e) => ProductMapper.toEntity(e))
          .toList(),
      price: userOrderModel.price,
    );
  }

  static UserOrderEntity toModel(UserOrder userOrder) {
    return UserOrderEntity(
      id: userOrder.id,
      date: userOrder.dateTime,
      products:
          userOrder.products.map((e) => ProductMapper.toModel(e)).toList(),
      price: userOrder.price,
    );
  }
}
