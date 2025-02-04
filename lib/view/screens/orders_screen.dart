import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:roast_coffee/model/product_model.dart';
import 'package:roast_coffee/service/data_base_service.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';
import 'package:roast_coffee/view/widgets/order_screen_widgets/order_product_card_widget.dart';
import 'package:roast_coffee/view/widgets/products_screen_widgets/products_appbar_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Color(0XFFF5F5F5),
      appBar: ProductsAppbarWidget(screenSize: screenSize,isProduct: false,title: 'Order History',),
      body: FutureBuilder<List<Product>>(
        future: DatabaseService().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.blueGrey,strokeWidth: 2,));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error hhh: ${snapshot.error}'));
          } else if (snapshot.data!.isEmpty) {
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LottieBuilder.asset('assets/animation/Animation - 1738649198133.json',height: screenSize.width/3,),
                TextWidget(text: 'Your cart is empty', color: Color(0XFF356B69), size: screenSize.width/22, weight: FontWeight.w500),
              ],
            ));
          } else {
            final products = snapshot.data!;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width/20,vertical: screenSize.width/22),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return OrderProductCardWidget(screenSize: screenSize, product: product,index: index,);
                },
              ),
            );
          }
        },
      ),
    );
  }
}