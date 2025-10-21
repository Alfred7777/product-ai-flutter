import 'package:flutter/material.dart';
import 'package:product_ai_flutter/models/product.dart';
import 'package:product_ai_flutter/widgets/product_search_bar.dart';
import 'package:product_ai_flutter/widgets/product_card.dart';

class ProductsTab extends StatelessWidget {
  final TextEditingController queryTextController;
  final List<Product> productList;

  const ProductsTab({
    super.key, 
    required this.queryTextController,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductSearchBar(
          queryTextController: queryTextController,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              final product = productList[index];
              return ProductCard(product: product);
            },
          ),
        ),
      ],
    );
  }
}