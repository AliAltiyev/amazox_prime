import 'package:data/connection/connection_impl.dart';
import 'package:data/data.dart';
import 'package:data/repository_impl/cart/cart_repository_impl.dart';
import 'package:data/repository_impl/connection/connection_impl.dart';

Future<void> initDataLayer() async {
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );
  //!Connection
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  getIt.registerLazySingleton<Connection>(() => ConnectionImpl(
        connection: getIt<InternetConnectionChecker>(),
      ));

  getIt.registerLazySingleton<ConnectionRepository>(
    () => ConnectionRepositoryImpl(connection: getIt<Connection>()),
  );

  getIt.registerLazySingleton<ConnectionUseCase>(() => ConnectionUseCase(
        connectionRepository: getIt<ConnectionRepository>(),
      ));

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      getIt<RemoteDataSource>(),
      getIt<Connection>(),
      getIt<LocaleDataSource>(),
    ),
  );

  //!Products

  getIt.registerLazySingleton<FetchProductsUseCase>(
    () => FetchProductsUseCase(repository: getIt()),
  );

  getIt.registerLazySingleton<FetchProductByIdUseCase>(
    () => FetchProductByIdUseCase(repository: getIt()),
  );

  getIt.registerLazySingleton<FetchMenuItemsUseCase>(
    () => FetchMenuItemsUseCase(productRepository: getIt()),
  );

  //!Theme
  getIt.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(localeDataSource: getIt()),
  );

  getIt.registerLazySingleton<SaveAppThemeUseCase>(
    () => SaveAppThemeUseCase(themeRepository: getIt<ThemeRepository>()),
  );

  getIt.registerLazySingleton<GetAppThemeUseCase>(
    () => GetAppThemeUseCase(themeRepository: getIt<ThemeRepository>()),
  );

  //!Cart
  getIt.registerLazySingleton<LocaleDataSource>(
    () => LocaleDataSourseImpl(),
  );

  getIt.registerLazySingleton<CartRepository>(
    () => CartRepossitoryImpl(localeStorage: getIt<LocaleDataSource>()),
  );

  getIt.registerLazySingleton<GetAllCartItemsUseCase>(
    () => GetAllCartItemsUseCase(cartRepository: getIt<CartRepository>()),
  );

  getIt.registerLazySingleton<RemoveAllCartItemsUseCase>(
    () => RemoveAllCartItemsUseCase(cartRepository: getIt<CartRepository>()),
  );

  getIt.registerLazySingleton<AddCartItemUseCase>(
    () => AddCartItemUseCase(cartRepository: getIt<CartRepository>()),
  );

  getIt.registerLazySingleton<RemoveCartItemUseCase>(
    () => RemoveCartItemUseCase(cartRepository: getIt<CartRepository>()),
  );
}
