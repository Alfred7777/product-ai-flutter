import 'package:flutter/material.dart';
import 'package:product_ai_flutter/models/product.dart';

class ProductsTab extends StatelessWidget {
  final List<Product> productList;

  const ProductsTab({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final product = productList[index];
        return ListTile(
          title: Text(product.title),
          subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
        );
      },
    );
  }
}