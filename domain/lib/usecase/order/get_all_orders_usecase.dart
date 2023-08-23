import 'package:domain/domain.dart';

final class GetAllUserOrdersUseCase {
  final OrderRepository _orderRepository;

  GetAllUserOrdersUseCase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  List<UserOrder> call() {
    return _orderRepository.getAllOrders();
  }
}
