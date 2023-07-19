import 'package:home/src/home.dart';

part 'home_event.dart';
part 'home_state.dart';

final class HomeBloc extends Bloc<ProductsEvent, HomeState> {
  final FetchProductsUseCase _getProductsUseCase;
  final ConnectionUseCase _connectionUseCase;
  HomeBloc({
    required FetchProductsUseCase getProductsUseCase,
    required ConnectionUseCase connectionUseCase,
  })  : _getProductsUseCase = getProductsUseCase,
        _connectionUseCase = connectionUseCase,
        super(InitialProductsState()) {
    on<FetchProductsEvent>(_fetchProductsEvent);
    add(FetchProductsEvent());
  }

  Future<FutureOr<void>> _fetchProductsEvent(
    FetchProductsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingProductsState());
    try {
      final List<Product> data = await _getProductsUseCase();
      emit(
        LoadedProductsState(products: data),
      );
    } catch (e) {
      emit(
        ErrorProductsState(error: StringConstants.stateError),
      );
    }
  }
}
