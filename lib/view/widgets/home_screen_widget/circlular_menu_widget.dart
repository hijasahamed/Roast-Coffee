import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/home_screen_controller.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';
import 'package:roast_coffee/view/widgets/home_screen_widget/product_circle_card_widget.dart';
import 'package:roast_coffee/view/widgets/skeloton_widget/circular_card_shimmer.dart';

class ProductCircularMenu extends StatelessWidget {
  const ProductCircularMenu({
    super.key,
    required this.screenSize,
    required this.productProvider,
  });

  final Size screenSize;
  final HomeProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width,
      padding: EdgeInsets.all(screenSize.width/20),
      margin: EdgeInsets.only(top: screenSize.width/100),
      color: Color(0XFFFFFFFF),
      child: FutureBuilder(
        future: Future.delayed(Duration(milliseconds: 1200)),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularCardShimmer(screenSize: screenSize);
          }else if (snapshot.hasError){
            return Center(child: TextWidget(text: 'Error: ${snapshot.error}', color: Colors.red, size: screenSize.width/35, weight: FontWeight.w400,maxline: true,alignTextCenter: true,));
          }
          return Consumer<HomeProvider>(
            builder: (context, provider, child) {
              return provider.products.isEmpty
              ? CircularCardShimmer(screenSize: screenSize)
              : Column(
                spacing: screenSize.width/25,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductCircleCard(screenSize: screenSize, imageUrl: provider.products[1].imageUrl, name: provider.products[1].name),
                      ProductCircleCard(screenSize: screenSize, imageUrl: provider.products[2].imageUrl, name: provider.products[2].name),
                      ProductCircleCard(screenSize: screenSize, imageUrl: provider.products[3].imageUrl, name: provider.products[3].name),
                      ProductCircleCard(screenSize: screenSize, imageUrl: provider.products[4].imageUrl, name: provider.products[4].name),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductCircleCard(screenSize: screenSize, imageUrl: provider.products[5].imageUrl, name: provider.products[5].name),
                      ProductCircleCard(screenSize: screenSize, imageUrl: provider.products[12].imageUrl, name: provider.products[13].name),
                      ProductCircleCard(screenSize: screenSize, imageUrl: provider.products[7].imageUrl, name: provider.products[7].name),
                      ProductCircleCard(screenSize: screenSize, imageUrl: provider.products[8].imageUrl, name: provider.products[8].name),
                    ],
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}