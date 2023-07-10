import 'package:domain/repository/theme/theme_repository.dart';

final class GetAppThemeUseCase {
  final ThemeRepository _themeRepository;

  GetAppThemeUseCase({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  Future<bool> call(String key) => _themeRepository.getAppTheme(key);
}
