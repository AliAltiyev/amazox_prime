import 'package:domain/domain.dart';

final class SaveUserOrderUseCase {
  final OrderRepository _orderRepository;

  SaveUserOrderUseCase({required OrderRepository orderRepository})
      : _orderRepository = orderRepository;

  Future<void> call({required UserOrder order}) async {
    return _orderRepository.saveOrder(order);
  }
}
