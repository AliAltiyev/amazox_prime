import 'package:home/src/home.dart';

part 'home_event.dart';
part 'home_state.dart';

final class HomeBloc extends Bloc<ProductsEvent, HomeState> {
  final FetchProductsUseCase _getProductsUseCase;
  final Connection _connection;
  final AppRouter _router;

  HomeBloc(
      {required FetchProductsUseCase getProductsUseCase,
      required Connection connectionUseCase,
      required AppRouter router})
      : _getProductsUseCase = getProductsUseCase,
        _connection = connectionUseCase,
        _router = router,
        super(InitialProductsState()) {
    on<FetchProductsEvent>(_fetchProductsEvent);
    on<NavigateToProductDetailsScreenEvent>(_onNavigateToProductDetailsScreen);
    add(FetchProductsEvent());
  }

  Future<void> _fetchProductsEvent(
    FetchProductsEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (!await _connection.isConnected()) {
      emit(NoInternetConnectionState());
    }
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

  void _onNavigateToProductDetailsScreen(
    NavigateToProductDetailsScreenEvent event,
    Emitter<HomeState> emit,
  ) {
    _router.push<Object?>(
      DetailsPage(productId: event.productId),
    );
  }
}
