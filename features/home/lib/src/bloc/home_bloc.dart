import 'package:home/src/home.dart';

part 'home_event.dart';
part 'home_state.dart';

final class HomeBloc extends Bloc<ProductsEvent, ProductsState> {
  final FetchProductsUseCase _getProductsUseCase;

  HomeBloc(
    FetchProductsUseCase getProductsUseCase,
  )   : _getProductsUseCase = getProductsUseCase,
        super(
          InitialProductsState(),
        ) {
    on<FetchProductsEvent>(_fetchProductsEvent);
    add(FetchProductsEvent());
  }

  Future<FutureOr<void>> _fetchProductsEvent(
    FetchProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(
      LoadingProductsState(),
    );
    try {
      final List<Product> data = await _getProductsUseCase();
      emit(LoadedProductsState(
        products: data,
      ));
    } catch (e) {
      emit(ErrorProductsState(
        error: StringConstants.stateError,
      ));
    }
  }
}
