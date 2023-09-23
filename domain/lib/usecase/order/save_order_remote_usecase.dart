import 'package:domain/domain.dart';

final class SaveOrderRemoteUseCase {
  final OrderRepository _orderRepository;

  SaveOrderRemoteUseCase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  Future<void> call({required UserOrder order}) async {
    return _orderRepository.saveOrderToFirebase(order);
  }
}
