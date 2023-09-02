import 'package:data/datasource/auth/auth_remote_data_source_impl.dart';
import 'package:data/model/order.dart';
import 'package:data/repository_impl/auth/auth_repository_impl.dart';
import 'package:data/repository_impl/cart/cart_repository_impl.dart';
import 'package:data/repository_impl/onboarding/on_boarding_repository_impl.dart';
import 'package:data/repository_impl/order/order_repository_impl.dart';
import 'package:data/repository_impl/settings/font/font_repository_impl.dart';

Future<void> initDataLayer() async {
  _initHiveAdapters();

  getIt.registerLazySingleton<RemoteDataSource>(
    RemoteDataSourceImpl.new,
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

  getIt.registerLazySingleton<LocaleDataSource>(
    LocaleDataSourceImpl.new,
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

  getIt.registerLazySingleton<SaveFontSizeUseCase>(
    () => SaveFontSizeUseCase(fontSizeRepository: getIt<FontSizeRepository>()),
  );

  getIt.registerLazySingleton<GetFontSizeUseCase>(
    () => GetFontSizeUseCase(
      fontSizeRepository: getIt<FontSizeRepository>(),
    ),
  );
  getIt.registerLazySingleton<UserLocale>(
    UserLocaleImpl.new,
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

  getIt.registerLazySingleton<GoogleSignIn>(GoogleSignIn.new);

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

  getIt.registerLazySingleton<SignInWithGoogleUseCase>(
    () => SignInWithGoogleUseCase(getIt<AuthRepository>()),
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

  //Order
  getIt.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(getIt<LocaleDataSource>()),
  );

  getIt.registerLazySingleton<GetAllUserOrdersUseCase>(
    () => GetAllUserOrdersUseCase(orderRepository: getIt<OrderRepository>()),
  );

  getIt.registerLazySingleton<SaveUserOrderUseCase>(
    () => SaveUserOrderUseCase(orderRepository: getIt<OrderRepository>()),
  );
}

void _initHiveAdapters() {
  Hive.registerAdapter<ProductModel>(ProductModelAdapter());
  Hive.registerAdapter<FontSizeModel>(FontSizeModelAdapter());
  Hive.registerAdapter<UserOrderEntity>(UserOrderEntityAdapter());
}
