import 'package:product_details/product_details.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final FetchProductByIdUseCase _fetchProductByIdUseCase;

  DetailsBloc(
    FetchProductByIdUseCase fetchProductByIdUseCase,
  )   : _fetchProductByIdUseCase = fetchProductByIdUseCase,
        super(
          InitialDetailsState(),
        ) {
    on<FetchProductEvent>(_fetchProductByIdEvent);
  }
  Future<void> _fetchProductByIdEvent(
      FetchProductEvent event, Emitter<DetailsState> emit) async {
    emit(LoadingDetailsState());
    try {
      final Product data = await _fetchProductByIdUseCase.call(
        event.productId,
      );
      emit(
        LoadedDetailsState(
          product: data,
        ),
      );
    } catch (e) {
      emit(
        FailedDetailsState(
          message: e.toString(),
        ),
      );
    }
  }
}
