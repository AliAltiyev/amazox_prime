import 'package:domain/domain.dart';

@immutable
final class Product extends Equatable {
  final String name;
  final String description;
  final String image;
  final int price;
  final int ml;
  final int id;
  final String bigDescription;
  final int rate;

  const Product({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.ml,
    required this.id,
    required this.bigDescription,
    required this.rate,
  });

  @override
  List<Object?> get props => <Object?>[
        name,
        description,
        image,
        price,
        ml,
        bigDescription,
        rate,
      ];
}
