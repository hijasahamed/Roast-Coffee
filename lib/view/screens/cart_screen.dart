import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key,required this.screenSize,});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            
          }, 
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,)
        ),
      ),
    );
  }
}