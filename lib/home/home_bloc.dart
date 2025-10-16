import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_ai_flutter/repositories/product_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository productRepository;

  HomeBloc(
    this.productRepository,
  ) : super(HomeUninitialized()) {
    // Define event handlers here
  }
}