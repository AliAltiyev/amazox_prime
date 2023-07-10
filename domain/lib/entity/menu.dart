import 'package:core/core.dart';
import 'package:flutter/material.dart';

@immutable
final class Menu extends Equatable {
  final String name;
  final String image;

  const Menu({
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [
        image,
        name,
      ];
}
