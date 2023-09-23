import 'package:domain/domain.dart';

final class GetOrdersPerDayUseCase {
  final OrderRepository _orderRepository;

  GetOrdersPerDayUseCase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  Future<List<int>> call() async {
    return _orderRepository.getOrdersPerDay();
  }
}
