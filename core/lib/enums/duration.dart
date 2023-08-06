import 'dart:core';

enum DurationEnum {
  low(
    Duration(
      milliseconds: 1,
    ),
  ),
  normal(Duration(
    milliseconds: 3,
  )),
  high(
    Duration(
      milliseconds: 5,
    ),
  );

  final Duration duration;

  const DurationEnum(
    this.duration,
  );
}
