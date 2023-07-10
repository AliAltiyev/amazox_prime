import 'package:data/data.dart';

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
