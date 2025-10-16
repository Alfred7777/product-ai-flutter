import 'package:equatable/equatable.dart';
import 'package:product_ai_flutter/models/product.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeUninitialized extends HomeState {}

class HomeLoading extends HomeState {}

class HomeReady extends HomeState {
  final List<Product> productList;

  const HomeReady({
    required this.productList,
  });

  @override
  List<Object> get props => [productList];
}

class HomeError extends HomeState {
  final String error;

  const HomeError({required this.error});

  @override
  List<Object> get props => [error];
}