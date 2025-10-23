import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final String title;
  final double price;
  final int quantity;
  final bool isProduct;

  const OrderItem({
    required this.title,
    required this.price,
    required this.quantity,
    required this.isProduct,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      title: json['title'] as String,
      price: json['price'].toDouble(),
      quantity: json['quantity'] as int,
      isProduct: json['isProduct'] as bool,
    );
  }
  
  @override
  List<Object?> get props => [title, price, quantity, isProduct];
}