import 'package:product_details/product_details.dart';

class ProductCounterCubit extends Cubit<int> {
  ProductCounterCubit() : super(1);

  void incrementProductCount() => emit(
        state + 1,
      );

  void decrementProductCount() {
    if (state > 1) {
      emit(state - 1);
    }
  }
}
