import 'package:flutter/material.dart';
import 'package:product_ai_flutter/models/product.dart';
import 'package:product_ai_flutter/resources/app_text_styles.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(product.title),
      titleTextStyle: AppTextStyles.kProductCardTitleStyle,
      trailing: Text('\$${product.price.toStringAsFixed(2)}'),
      leadingAndTrailingTextStyle: AppTextStyles.kProductCardContentStyle,
    );
  }
}