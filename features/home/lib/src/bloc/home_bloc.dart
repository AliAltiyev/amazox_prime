import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/enums/duration.dart';
import 'package:core/extensions/duration.dart';
import 'package:domain/entity/product.dart';
import 'package:domain/usecase/get_products.dart';
import 'package:flutter/cupertino.dart';

part 'home_event.dart';
part 'home_state.dart';

final class HomeBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  HomeBloc(GetProductsUseCase getProductsUseCase)
      : _getProductsUseCase = getProductsUseCase,
        super(InitialProductsState()) {
    on<FetchProductsEvent>(_fetchProductsEvent);
  }

  Future<FutureOr<void>> _fetchProductsEvent(
      FetchProductsEvent event, Emitter<ProductsState> emit) async {
    emit(LoadingProductsState());
    Future.delayed(DurationEnum.normal.getDuration);
    try {
      final data = await _getProductsUseCase();
      emit(LoadedProductsState(products: data));
    } catch (e) {
      emit(ErrorProductsState(error: "here  $e is flutter error"));
    }
  }
}
