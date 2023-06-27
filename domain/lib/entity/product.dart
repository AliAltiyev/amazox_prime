import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
final class Product extends Equatable {
  final String name;
  final String description;
  final String image;
  final int price;
  final int ml;
  final int id;

  const Product(
      {required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.ml,
      required this.id});

  @override
  List<Object?> get props => [name, description, image, price, ml];
}
