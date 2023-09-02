import 'package:domain/entity/font_size.dart';
import 'package:domain/repository/settings/font/font_size_repository.dart';

final class SaveFontSizeUseCase {
  final FontSizeRepository _fontSizeRepository;

  const SaveFontSizeUseCase({
    required FontSizeRepository fontSizeRepository,
  }) : _fontSizeRepository = fontSizeRepository;

  Future<void> call({required FontSizeEntity fontSize}) {
    return _fontSizeRepository.saveFontSize(fontSize);
  }
}
