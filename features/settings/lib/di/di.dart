import 'package:core/core.dart';
import 'package:settings/cubit/theme_cubit.dart';

void initSettings() {
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(),
  );
}
