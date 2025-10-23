import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_ai_flutter/models/order_item.dart';
import 'package:product_ai_flutter/repositories/product_repository.dart';
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
        final productList = await productRepository.fetchProducts(event.textFilter);
        final orderList = <OrderItem>[];

        emit(
          HomeReady(
            productList: productList,
            orderList: orderList,
          ),
        );
      } catch (e) {
        emit(
          HomeError(
            error: e.toString().substring(11),
          ),
        );
      }
    });
    on<AnalyzeOrder>((event, emit) async {
      emit(HomeLoading());
      try {
        final productList = await productRepository.fetchProducts('');
        final orderList = await productRepository.analyzeOrder(event.order, productList);

        emit(
          HomeReady(
            productList: productList,
            orderList: orderList,
          ),
        );
      } catch (e) {
        emit(
          HomeError(
            error: e.toString().substring(11),
          ),
        );
      }
    });
  }
}