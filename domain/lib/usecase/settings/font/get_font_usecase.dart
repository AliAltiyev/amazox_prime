import 'package:domain/entity/font_size.dart';
import 'package:domain/repository/settings/font/font_size_repository.dart';

final class GetFontSizeUseCase {
  final FontSizeRepository _fontSizeRepository;

  const GetFontSizeUseCase({
    required FontSizeRepository fontSizeRepository,
  }) : _fontSizeRepository = fontSizeRepository;

  FontSizeEntity call() {
    return _fontSizeRepository.getFontSize();
  }
}
