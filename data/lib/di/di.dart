import 'package:data/data.dart';

Future<void> initDataLayer() async {
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
}
