import 'package:data/data.dart';

part 'order.g.dart';

@HiveType(typeId: 3)
final class UserOrderModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final List<ProductModel> products;
  @HiveField(2)
  final DateTime dateTime;
  @HiveField(3)
  final double price;

  const UserOrderModel({
    required this.id,
    required this.products,
    required this.dateTime,
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
