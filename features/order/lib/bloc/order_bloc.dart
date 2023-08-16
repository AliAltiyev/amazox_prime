import 'dart:async';

import '../order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetAllUserOrdersUseCase _getAllUserOrders;

  OrderBloc({
    required GetAllUserOrdersUseCase getAllUserOrders,
  })  : _getAllUserOrders = getAllUserOrders,
        super(OrdersLoading()) {
    on<FetchAllOrders>(_onFetchAllOrders);
  }

  Future<void> _onFetchAllOrders(
    FetchAllOrders event,
    Emitter<OrderState> emit,
  ) async {
    try {
      final List<UserOrder> orders = _getAllUserOrders();
      emit(OrdersLoaded(orders: orders));
    } catch (e) {
      OrdersFailure();
    }
  }
}
