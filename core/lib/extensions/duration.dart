import 'package:core/enums/duration.dart';

extension DurationEx on DurationEnum {
  Duration get getDuration {
    const low = 1;
    const normal = 3;
    const high = 5;

    switch (this) {
      case DurationEnum.low:
        return const Duration(milliseconds: low);
      case DurationEnum.normal:
        return const Duration(milliseconds: normal);
      case DurationEnum.high:
        return const Duration(milliseconds: high);
    }
  }
}
