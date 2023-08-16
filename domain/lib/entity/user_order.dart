import 'package:domain/domain.dart';

@immutable
final class UserOrder extends Equatable {
  final String id;
  final List<Product> products;
  final DateTime dateTime;
  final double price;

  const UserOrder({
    required this.id,
    required this.dateTime,
    required this.products,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        products,
        dateTime,
        price,
      ];
}
