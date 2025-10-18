import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_ai_flutter/repositories/product_repository.dart';
import 'package:product_ai_flutter/resources/app_strings.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository productRepository;

  HomeBloc(
    this.productRepository,
  ) : super(HomeUninitialized()) {
    on<FetchProducts>((event, emit) async {
      emit(HomeLoading());
      try {
        final productList = await productRepository.fetchProducts();

        emit(
          HomeReady(
            productList: productList,
          ),
        );
      } catch (e) {
        emit(
          HomeError(
            error: AppStrings.kLoadProductsError,
          ),
        );
      }
    });
  }
}