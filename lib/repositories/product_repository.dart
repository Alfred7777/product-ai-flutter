import 'dart:convert';

import 'package:product_ai_flutter/models/product.dart';
import 'package:product_ai_flutter/resources/app_strings.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    final bool isConnected = await InternetConnection().hasInternetAccess;
    if (!isConnected) {
      throw Exception(AppStrings.kInternetAccessError);
    }

    var response = await http.get(Uri.parse('https://dummyjson.com/products?limit=50'));
    if (response.statusCode != 200) {
      throw Exception(AppStrings.kLoadProductsError);
    }

    var products = jsonDecode(response.body)['products'];
    return List<Product>.from(products.map((product) => Product.fromJson(product)));
  }
}