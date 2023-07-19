extension NullableString on String? {
  String get orNull => '';
}

extension StringExtension on String {
  static String get orEmpty => '';
}
