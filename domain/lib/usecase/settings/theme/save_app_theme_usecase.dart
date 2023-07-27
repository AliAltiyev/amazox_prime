import 'package:domain/repository/settings/theme/theme_repository.dart';

final class SaveAppThemeUseCase {
  final ThemeRepository _themeRepository;

  SaveAppThemeUseCase({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  Future<void> call(bool isDark) => _themeRepository.saveAppTheme(isDark);
}
