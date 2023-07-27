import 'package:data/data.dart';
import 'package:data/mapper/font_size.dart';

final class FontSizeRepositoryImpl extends FontSizeRepository {
  final LocaleDataSource _localeStorage;

  FontSizeRepositoryImpl({
    required LocaleDataSource localeStorage,
  }) : _localeStorage = localeStorage;

  @override
  FontSizeEntity getFontSize() {
    final FontSizeModel model = _localeStorage.getFontSize();
    return FontSizeMapper.toEntity(model);
  }

  @override
  Future<void> saveFontSize(FontSizeEntity fontSize) async {
    await _localeStorage.saveFontSize(
      FontSizeMapper.toModel(fontSize),
    );
  }
}
