import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final double price;

  const Product({
    required this.id,
    required this.title,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'].toDouble(),
    );
  }
  
  @override
  List<Object?> get props => [id, title, price];
}