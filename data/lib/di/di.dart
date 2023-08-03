import 'package:data/datasource/auth/auth_remote_data_source_impl.dart';
import 'package:data/repository_impl/auth/auth_repository_impl.dart';
import 'package:data/repository_impl/cart/cart_repository_impl.dart';
import 'package:data/repository_impl/onboarding/onboarding_repository_impl.dart';
import 'package:data/repository_impl/settings/font/font_repository_impl.dart';

import '../datasource/auth/auth_remote_data_source.dart';

Future<void> initDataLayer() async {
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      getIt<RemoteDataSource>(),
      getIt<Connection>(),
      getIt<LocaleDataSource>(),
    ),
  );

  ///Products
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

  ///Cart
  getIt.registerLazySingleton<LocaleDataSource>(
    () => LocaleDataSourseImpl(
      userStateBox: Hive.box<bool>(LocaleStorage.userAuth.name),
      cartBox: Hive.box<ProductModel>(LocaleStorage.cart.name),
      products: Hive.box<ProductModel>(LocaleStorage.products.name),
      theme: Hive.box<bool>(LocaleStorage.theme.name),
      font: Hive.box<FontSizeModel>(LocaleStorage.font.name),
    ),
  );

  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(localeStorage: getIt<LocaleDataSource>()),
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

  /// Font
  getIt.registerLazySingleton<FontSizeRepository>(() => FontSizeRepositoryImpl(
        localeStorage: getIt<LocaleDataSource>(),
      ));

  getIt.registerLazySingleton<SaveFontSizeUsecase>(() =>
      SaveFontSizeUsecase(fontSizeRepository: getIt<FontSizeRepository>()));

  getIt.registerLazySingleton<GetFontSizeUsecase>(
    () => GetFontSizeUsecase(
      fontSizeRepository: getIt<FontSizeRepository>(),
    ),
  );

  getIt.registerLazySingleton<OnBoardingRepository>(
    () => OnBoardingRepositoryImpl(
      getIt<LocaleDataSource>(),
    ),
  );

  getIt.registerLazySingleton(
    () => CheckIfUserIsFirstTimerUseCase(
        repository: getIt<OnBoardingRepository>()),
  );

  getIt.registerLazySingleton(
    () => CacheFirstTimerUseCase(repository: getIt<OnBoardingRepository>()),
  );

  ///Auth

  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  getIt.registerLazySingleton<FirebaseStorage>(
    () => FirebaseStorage.instance,
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
            authClient: getIt<FirebaseAuth>(),
            cloudStoreClient: getIt<FirebaseFirestore>(),
            dbClient: getIt<FirebaseStorage>(),
          ));

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRemoteRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<LogOutUseCase>(
    () => LogOutUseCase(getIt<AuthRepository>()),
  );

  getIt.registerSingleton<SignUpUseCase>(
    SignUpUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<UpdateUserUseCase>(
    () => UpdateUserUseCase(getIt<AuthRepository>()),
  );
}
