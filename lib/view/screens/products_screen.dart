import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/products_screen_widgets/products_appbar_widget.dart';
import 'package:roast_coffee/view/widgets/products_screen_widgets/products_body_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.screenSize});
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      appBar: ProductsAppbarWidget(screenSize: screenSize,isProduct: true,title: 'Products',),
      body: ProductBodyWidget(screenSize: screenSize),
    );
  }
}



