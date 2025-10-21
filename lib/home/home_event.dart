import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchProducts extends HomeEvent {
  final String textFilter;

  const FetchProducts(this.textFilter);

  @override
  List<Object> get props => [textFilter];
}

class AnalyzeOrder extends HomeEvent {
  final String order;

  const AnalyzeOrder(this.order);

  @override
  List<Object> get props => [order];
}