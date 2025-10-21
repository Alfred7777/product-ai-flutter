import 'package:flutter/material.dart';
import 'package:product_ai_flutter/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      trailing: Text('\$${product.price.toStringAsFixed(2)}'),
    );
  }
}