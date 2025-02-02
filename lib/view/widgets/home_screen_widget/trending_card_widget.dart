import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/home_screen_controller.dart';
import 'package:roast_coffee/view/widgets/skeloton_widget/skeloton_widget.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';
import 'package:roast_coffee/view/widgets/home_screen_widget/product_card_widget.dart';

class TrendingCardWidget extends StatelessWidget {
  const TrendingCardWidget({
    super.key,
    required this.screenSize,
    required this.productProvider,
  });

  final Size screenSize;
  final HomeProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height/3.5,
      padding: EdgeInsets.only(top: screenSize.width/25,left: screenSize.width/25,right: screenSize.width/25,bottom: 0),
      child: Column(
        spacing: screenSize.height/150,
        children: [
          Row(
            children: [
              TextWidget(text: 'Trending', color: Color(0XFF356B69), size: screenSize.width/20, weight: FontWeight.w600),
              SizedBox(width: screenSize.width/55,),
              Container(
                height: screenSize.width/18.5,
                width: screenSize.width/12.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenSize.width/50),
                  color: Color(0XFFCEAC6D)
                ),
                child: Center(child: TextWidget(text: '16', color: Color(0XFFFFFFFF), size: screenSize.width/32, weight: FontWeight.w600)),
              ),
              Spacer(),
              SizedBox(
                child: Row(
                  spacing: screenSize.width/55,
                  children: [
                    TextWidget(text: 'View all', color: Color(0XFF356B69), size: screenSize.width/30, weight: FontWeight.w600),
                    Icon(Icons.arrow_forward_ios,color: Color(0XFF356B69),size: screenSize.width/37,)
                  ],
                ),
              )
            ],
          ),
          FutureBuilder(
            future: productProvider.fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                  child: Row(
                    children: [
                      ProductCardSkeleton(screenSize: screenSize),
                      ProductCardSkeleton(screenSize: screenSize),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: TextWidget(text: 'Error: ${snapshot.error}', color: Colors.red, size: screenSize.width/35, weight: FontWeight.w400,maxline: true,alignTextCenter: true,));
              }                    
              return Consumer<HomeProvider>(
                builder: (context, provider, child) {
                  return provider.products.isEmpty
                  ? Center(child: TextWidget(text: 'No products available', color: Color(0XFF356B69), size: screenSize.width/30, weight: FontWeight.w500))
                  : Expanded(
                      child: Row(
                        children: [
                          
                          ProductCard(
                            screenSize: screenSize,
                            name: provider.products[11].name,
                            price: provider.products[11].price,
                            currency: provider.products[11].currency,
                            rating: provider.products[11].rating,
                            imageUrl: provider.products[11].imageUrl,
                            ratingCount: provider.products[11].ratingCount,
                            makingTime: provider.products[11].makingTime,
                          ),
                          
                          ProductCard(
                            screenSize: screenSize,
                            name: provider.products[1].name,
                            price: provider.products[1].price,
                            currency: provider.products[1].currency,
                            rating: provider.products[1].rating,
                            imageUrl: provider.products[1].imageUrl,
                            ratingCount: provider.products[1].ratingCount,
                            makingTime: provider.products[1].makingTime,
                          ),
                        ],
                      ),
                    );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}