import 'package:domain/entity/font_size.dart';
import 'package:domain/repository/settings/font/font_size_repository.dart';

final class SaveFontSizeUsecase {
  final FontSizeRepository _fontSizeRepository;

  const SaveFontSizeUsecase({
    required FontSizeRepository fontSizeRepository,
  }) : _fontSizeRepository = fontSizeRepository;

  Future<void> call({required FontSizeEntity fontsize}) {
    return _fontSizeRepository.saveFontSize(fontsize);
  }
}
