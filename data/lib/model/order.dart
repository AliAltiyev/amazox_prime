import 'package:data/data.dart';

part 'order.g.dart';

@HiveType(typeId: 3)
final class UserOrderEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final List<ProductModel> products;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final double price;

  const UserOrderEntity({
    required this.id,
    required this.products,
    required this.date,
    required this.price,
  });

  @override
  List<Object?> get props => <Object?>[
        id,
        products,
        date,
        price,
      ];
}
