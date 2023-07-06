import 'package:product_details/product_details.dart';

void initDetails() {
  getIt.registerLazySingleton<DetailsBloc>(
    () => DetailsBloc(
      getIt(),
    ),
  );
}
