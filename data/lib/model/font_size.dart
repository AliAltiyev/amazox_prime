import 'package:data/data.dart';

part 'font_size.g.dart';

@HiveType(typeId: 2)
final class FontSizeModel {
  @HiveField(0)
  final double fontSize;

  FontSizeModel({
    required this.fontSize,
  });
}
