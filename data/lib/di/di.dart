import 'package:data/data.dart';

import '../datasource/locale/locale_data_sourse.dart';

Future<void> initDataLayer() async {
  //Product
  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getIt()));

  getIt.registerLazySingleton<FetchProductsUseCase>(
    () => FetchProductsUseCase(repository: getIt()),
  );

  getIt.registerLazySingleton<FetchProductByIdUseCase>(
    () => FetchProductByIdUseCase(repository: getIt()),
  );

  getIt.registerLazySingleton<FetchMenuItemsUseCase>(
    () => FetchMenuItemsUseCase(productRepository: getIt()),
  );

  getIt.registerLazySingleton<LocaleDataSource>(() => LocaleDataSourseImpl());

  getIt.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(localeDataSource: getIt()),
  );

  getIt.registerLazySingleton<SaveAppThemeUseCase>(
    () => SaveAppThemeUseCase(themeRepository: getIt()),
  );

  getIt.registerLazySingleton<GetAppThemeUseCase>(
    () => GetAppThemeUseCase(themeRepository: getIt()),
  );
}
