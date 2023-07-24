import 'package:domain/entity/font_size.dart';

abstract class FontSizeRepository {
  Future<void> saveFontSize(FontSizeEntity fontSize);

  FontSizeEntity getFontSize();
}
