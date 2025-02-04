import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:roast_coffee/controller/splash_screen_controller.dart';
import 'package:roast_coffee/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier{

  List<dynamic> _products = [];
  List<dynamic> get products => _products;

  

  Future<void> fetchProducts(context) async {
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
          // Check if image URL is null or empty
          String imageUrl = item['image_url'] ?? '';
          if (imageUrl.isEmpty || !Uri.parse(imageUrl).isAbsolute || imageUrl.contains('404')) {
            imageUrl = "https://redthread.uoregon.edu/files/original/affd16fd5264cab9197da4cd1a996f820e601ee4.png";
          }
          return Product.fromJson({...item, 'imageUrl': imageUrl});
        }).toList();
        notifyListeners();
      }
       else {
        throw Exception("Failed to load products");
      }
    } catch (error) {
      throw Exception("Error fetching products: $error");
    }
  }

  Future<void> logoutUser(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("auth_token"); 
    await prefs.setBool(logedInKey, false); 
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }
}