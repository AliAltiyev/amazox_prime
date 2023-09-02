import 'dart:core';

enum DurationEnum {
  low(
    Duration(
      milliseconds: 100,
    ),
  ),
  normal(Duration(
    milliseconds: 300,
  )),
  high(
    Duration(
      milliseconds: 500,
    ),
  );

  final Duration duration;

  const DurationEnum(
    this.duration,
  );
}
