import 'package:flutter/material.dart';
import 'package:roast_coffee/model/product_model.dart';
import 'package:roast_coffee/service/data_base_service.dart';
import 'package:roast_coffee/view/widgets/common_widgets/snackbar_widget.dart';

class CartProvider extends ChangeNotifier {

  Future<void> cartButtonClicked(context, Product product) async {
    // Check if the product is already in the cart
    final dbService = DatabaseService();

    bool exists = await dbService.productExists(product.id);
    if (exists) {
      snackbarWidget('Product already in cart!', context, Colors.red);
    } else {
      // Add the product to the database
      await dbService.addProduct(product);
      snackbarWidget('Product added to cart!', context, Colors.green);
    }
  }
  
}