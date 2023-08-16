part of 'order_bloc.dart';

@immutable
abstract class OrderState extends Equatable {}

final class OrdersLoading extends OrderState {
  @override
  List<Object?> get props => <Object?>[];
}

final class OrdersLoaded extends OrderState {
  final List<UserOrder> orders;

  OrdersLoaded({required this.orders});

  @override
  List<Object?> get props => <Object?>[];
}

final class OrdersFailure extends OrderState {
  @override
  List<Object?> get props => <Object?>[];
}
