import 'package:data/data.dart';
import 'package:data/datasource/locale/locale_data_sourcse_impl.dart';
import 'package:data/datasource/locale/locale_data_sourse.dart';
import 'package:data/repository_impl/theme/theme_repository_impl.dart';
import 'package:domain/repository/theme/theme_repository.dart';

Future<void> initDataLayer() async {
  //Product
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(getIt.get()),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<FetchProductsUseCase>(
    () => FetchProductsUseCase(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton<FetchProductByIdUseCase>(
    () => FetchProductByIdUseCase(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton<LocaleDataSource>(
    () => LocaleDataSourseImpl(),
  );

  getIt.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(
      localeDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<SaveAppThemeUseCase>(
    () => SaveAppThemeUseCase(
      themeRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetAppThemeUseCase>(
    () => GetAppThemeUseCase(
      themeRepository: getIt(),
    ),
  );
}
