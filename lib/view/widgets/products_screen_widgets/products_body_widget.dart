import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/home_screen_controller.dart';
import 'package:roast_coffee/view/screens/cart_screen.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';
import 'package:roast_coffee/view/widgets/home_screen_widget/product_card_widget.dart';

class ProductBodyWidget extends StatelessWidget {
  const ProductBodyWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width/35),
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return provider.products.isEmpty?
          Center(child: TextWidget(text: 'No products available', color: Color(0XFF356B69), size: screenSize.width/30, weight: FontWeight.w500))
          : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,  
              crossAxisSpacing: screenSize.width / 50,  
              mainAxisSpacing: screenSize.height / 50,  
              childAspectRatio: screenSize.width / (screenSize.height / 2.0), 
            ),
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final product = provider.products[index];
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return CartScreen(screenSize: screenSize,product: product,);
                  },));
                },
                child: ProductCard(
                  name: product.name,
                  price: product.price,
                  currency: product.currency,
                  rating: product.rating,
                  imageUrl: product.imageUrl,
                  screenSize: screenSize,
                  ratingCount: product.ratingCount,
                  makingTime: product.makingTime,
                ),
              );
            },
          );
        },
      ),
    );
  }
}