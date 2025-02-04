import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:roast_coffee/model/product_model.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class OrderProductCardWidget extends StatelessWidget {
  const OrderProductCardWidget({
    super.key,
    required this.screenSize,
    required this.product,
    required this.index
  });

  final Size screenSize;
  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: screenSize.width/50),
      width: screenSize.width,
      padding: EdgeInsets.symmetric(horizontal: screenSize.width/45,vertical: screenSize.width/45),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize.width/35),
        color: Color(0XFFFFFFFF)
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(screenSize.width/35),
                child: Image.network(
                  product.imageUrl,
                  height: screenSize.width / 4.5,
                  width: screenSize.width / 2.8,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Image.asset('assets/images/placeholder.png', fit: BoxFit.cover);
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return LottieBuilder.asset(
                      'assets/animation/Animation - 1738647720137.json',
                      height: screenSize.width / 4.5,width: screenSize.width / 2.8,
                    );
                  },
                ),
              ),
              SizedBox(width: screenSize.width/25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: product.name, color: Color(0XFF356B69), size: screenSize.width / 22, weight: FontWeight.w600),
                  TextWidget(text: '${product.currency} ${product.price}', color: Color(0XFFCEAC6D), size: screenSize.width / 30, weight: FontWeight.w600),
                  SizedBox(height: screenSize.width/60,),
                  TextWidget(text: product.orderDateTime, color: Color(0XFF6E8382), size: screenSize.width / 35, weight: FontWeight.w600),
                  TextWidget(text: index==0? 'Order placed.':'Delivered.', color: index==0? Color(0XFF6E8382):Color(0XFF73AB89), size: screenSize.width/30, weight: FontWeight.w500),
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
            left: screenSize.width/1.28,
            top: 0,
            bottom: 0,
            child: Center(
              child: IconButton(
                onPressed: () {
                  
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0XFFCEAC6D),
                  size: screenSize.width / 18,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}