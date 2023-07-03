import 'package:data/data.dart';
import 'package:domain/usecase/get_menu.dart';

final getIt = GetIt.instance;

Future<void> initDataLayer() async {
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<FetchProductsUseCase>(
    () => FetchProductsUseCase(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton<FetchMenuItemsUseCase>(
    () => FetchMenuItemsUseCase(
      productRepository: getIt(),
    ),
  );
}
