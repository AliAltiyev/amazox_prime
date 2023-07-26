import 'package:domain/entity/font_size.dart';
import 'package:domain/repository/settings/font/font_size_repository.dart';

final class GetFontSizeUsecase {
  final FontSizeRepository _fontSizeRepository;

  const GetFontSizeUsecase({
    required FontSizeRepository fontSizeRepository,
  }) : _fontSizeRepository = fontSizeRepository;

  FontSizeEntity call() {
    return _fontSizeRepository.getFontSize();
  }
}
