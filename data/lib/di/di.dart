import 'package:data/datasource/auth/auth_remote_data_source_impl.dart';
import 'package:data/repository_impl/auth/auth_repository_impl.dart';
import 'package:data/repository_impl/cart/cart_repository_impl.dart';
import 'package:data/repository_impl/onboarding/on_boarding_repository_impl.dart';
import 'package:data/repository_impl/settings/font/font_repository_impl.dart';

Future<void> initDataLayer() async {
  initHiveBox();

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
        () => LocaleDataSourceImpl(
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
  getIt.registerLazySingleton<FontSizeRepository>(
    () => FontSizeRepositoryImpl(
      localeStorage: getIt<LocaleDataSource>(),
    ),
  );

  getIt.registerLazySingleton<SaveFontSizeUsecase>(
    () => SaveFontSizeUsecase(fontSizeRepository: getIt<FontSizeRepository>()),
  );

  getIt.registerLazySingleton<GetFontSizeUsecase>(
    () => GetFontSizeUsecase(
      fontSizeRepository: getIt<FontSizeRepository>(),
    ),
  );
  getIt.registerLazySingleton<UserLocale>(
    () => UserLocaleImpl(
      userStateBox: Hive.box<bool>(LocaleStorage.userAuth.name),
    ),
  );

  getIt.registerLazySingleton<OnBoardingRepository>(
    () => OnBoardingRepositoryImpl(
      getIt<UserLocale>(),
    ),
  );

  getIt.registerLazySingleton(
    () => CheckIfUserIsFirstTimerUseCase(
      repository: getIt<OnBoardingRepository>(),
    ),
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

  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      googleSignIn: getIt<GoogleSignIn>(),
      authClient: getIt<FirebaseAuth>(),
      cloudStoreClient: getIt<FirebaseFirestore>(),
    ),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRemoteRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<SigninWithGoogleUseCase>(
    () => SigninWithGoogleUseCase(getIt<AuthRepository>()),
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
}

Future<void> initHiveBox() async {
  getIt.registerLazySingletonAsync<Box<bool>>(() async {
    return Hive.openBox<bool>(LocaleStorage.userAuth.name);
  });

  getIt.registerLazySingletonAsync<Box<FontSizeModel>>(() async {
    return Hive.openBox<FontSizeModel>(LocaleStorage.font.name);
  });

  getIt.registerLazySingletonAsync<Box<ProductModel>>(() async {
    return Hive.openBox<ProductModel>(LocaleStorage.products.name);
  });

  getIt.registerLazySingletonAsync<Box<ProductModel>>(() async {
    return Hive.openBox<ProductModel>(LocaleStorage.cart.name);
  });

  getIt.registerLazySingletonAsync<Box<bool>>(() async {
    return Hive.openBox<bool>(LocaleStorage.theme.name);
  });
}
