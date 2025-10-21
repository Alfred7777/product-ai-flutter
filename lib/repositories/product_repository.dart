import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:product_ai_flutter/models/order_item.dart';
import 'package:product_ai_flutter/models/product.dart';
import 'package:product_ai_flutter/resources/app_strings.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<Product>> fetchProducts(String textFilter) async {
    final bool isConnected = await InternetConnection().hasInternetAccess;
    if (!isConnected) {
      throw Exception(AppStrings.kInternetAccessError);
    }

    http.Response response;
    if (textFilter.isNotEmpty) {
      response = await http.get(Uri.parse('https://dummyjson.com/products/search?q=$textFilter'));
    } else {
      response = await http.get(Uri.parse('https://dummyjson.com/products?limit=0'));
    }
    
    if (response.statusCode != 200) {
      throw Exception(AppStrings.kLoadProductsError);
    }

    var products = jsonDecode(response.body)['products'];
    return List<Product>.from(products.map((product) => Product.fromJson(product)));
  }

  Future<List<OrderItem>> analyzeOrder(String order, List<Product> productList) async {
    final bool isConnected = await InternetConnection().hasInternetAccess;
    if (!isConnected) {
      throw Exception(AppStrings.kInternetAccessError);
    }

    final String googleApiKey;
    try {
      Map<String, dynamic> configJson = jsonDecode(await rootBundle.loadString('config/app_config.json'));
      googleApiKey = configJson['GOOGLE_API_KEY'];
    } catch (e) {
      throw Exception(AppStrings.kAPIKeyError);
    }

    var response = await http.post(
      Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent'),
      headers: {
        'Content-Type': 'application/json',
        'x-goog-api-key': googleApiKey,
      },
      body: jsonEncode({
        "contents": [{
          "parts": [{
            "text": "Analyze the following order and return a JSON array of products with their names and quantities: $order"
          }]
        }]
      }),
    );

    if (response.statusCode != 200) {
      throw Exception(AppStrings.kAnalyzeOrderError);
    }

    return List<OrderItem>.empty();
  }
}