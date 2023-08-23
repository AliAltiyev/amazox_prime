part of 'order_bloc.dart';

@immutable
abstract class OrderEvent extends Equatable {}

final class FetchAllOrders extends OrderEvent {
  @override
  List<Object?> get props => <Object?>[];
}
