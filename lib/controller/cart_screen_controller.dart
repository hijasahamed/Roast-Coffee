import 'package:flutter/material.dart';
import 'package:roast_coffee/model/product_model.dart';
import 'package:roast_coffee/service/data_base_service.dart';

class CartProvider extends ChangeNotifier {
  // final List<Product> _cart = [];

  // List<Product> get cart => _cart;

  // void addProductToCart(Product product) {
  //   _cart.add(product);
  //   notifyListeners();
  // }

  // void removeProductFromCart(Product product) {
  //   _cart.remove(product);
  //   notifyListeners();
  // }

  Future<void> cartButtonClicked(context, Product product) async {
    // Check if the product is already in the cart (SQLite)
    final dbService = DatabaseService();

    bool exists = await dbService.productExists(product.id);
    if (exists) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product already in cart!')),
      );
    } else {
      // Add the product to the database
      await dbService.addProduct(product);

      // Update provider state if needed
      // addProductToCart(product); // Update your provider here

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added to cart!')),
      );
    }
  }
  
}