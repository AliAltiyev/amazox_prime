extension StringEx on String {
  String get toCurrency => '$this₽';

  String get toWeight => '$this г';
}

extension NullableString on String? {
  static const empty = '';

  String get orEmpty => empty;

  }

