import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:roast_coffee/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier{

  List<dynamic> _products = [];
  List<dynamic> get products => _products;

  

  Future<void> fetchProducts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final authToken = prefs.getString("auth_token") ?? "";
      final String url = dotenv.env['PRODUCT_API'].toString();

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': authToken,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        _products = jsonData.map((item) {
          // Check if image URL is null or empty or 404
          String imageUrl = item['imageUrl'] ?? '';
          if (imageUrl.isEmpty || !Uri.parse(imageUrl).isAbsolute || imageUrl.contains('404')) {
            imageUrl = "https://redthread.uoregon.edu/files/original/affd16fd5264cab9197da4cd1a996f820e601ee4.png";
          }
          return Product.fromJson({...item, 'imageUrl': imageUrl});
        }).toList();
        notifyListeners();
        print(_products);
      } else {
        throw Exception("Failed to load products");
      }
    } catch (error) {
      throw Exception("Error fetching products: $error");
    }
  }
}