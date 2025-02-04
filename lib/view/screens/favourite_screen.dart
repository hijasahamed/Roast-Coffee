import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';
import 'package:roast_coffee/view/widgets/products_screen_widgets/products_appbar_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      appBar: ProductsAppbarWidget(screenSize: screenSize, title: 'Favorite', isProduct: false),
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset('assets/animation/Animation - 1738649198133.json',height: screenSize.width/3,),
            TextWidget(text: 'Nothing in favorites', color: Color(0XFF356B69), size: screenSize.width/22, weight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}