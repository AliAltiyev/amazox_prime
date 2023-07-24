import 'package:data/data.dart';

abstract class FontSizeMapper {
  static FontSizeEntity toEntity(FontSizeModel model) {
    return FontSizeEntity(
      fontSize: model.fontSize,
    );
  }

  static FontSizeModel toModel(FontSizeEntity model) {
    return FontSizeModel(
      fontSize: model.fontSize,
    );
  }
}
