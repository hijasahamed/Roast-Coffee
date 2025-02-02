import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String currency;
  final double rating;
  final String imageUrl;
  final Size screenSize;
  final int ratingCount;
  final String makingTime;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.currency,
    required this.rating,
    required this.imageUrl,
    required this.screenSize,
    required this.ratingCount,
    required this.makingTime
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        color: Color(0XFFFFFFFF),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(screenSize.width/35)
          ),
          padding: EdgeInsets.all(screenSize.width/60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenSize.height/9,
                width: screenSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenSize.width/35)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenSize.width / 60),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                      return Center(
                        child: TextWidget(
                          text: 'No image',
                          color: Colors.red,
                          size: screenSize.width / 35,
                          weight: FontWeight.w400,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: screenSize.width/35,),
              Padding(
                padding: EdgeInsets.only(left: screenSize.width/55,right: screenSize.width/55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: name, color: Color(0XFF356B69), size: screenSize.width/24, weight: FontWeight.w600),
                    Row(
                      children: [
                        Image.asset('assets/images/tabler-icon-star-filled.png',height: screenSize.width/28,width: screenSize.width/28,),
                        SizedBox(width: screenSize.width/70,),
                        TextWidget(text: '$rating', color: Color(0XFF6E8382), size: screenSize.width/25, weight: FontWeight.w500),
                        SizedBox(width: screenSize.width/120,),
                        TextWidget(text: '(${ratingCount.toString()})', color: Color(0XFF6E8382), size: screenSize.width/35, weight: FontWeight.w500),
                        Spacer(),
                        TextWidget(text: makingTime, color: Color(0XFF6E8382), size: screenSize.width/35, weight: FontWeight.w500),
                        
                      ],
                    ),
                    TextWidget(text: '$currency $price', color: Color(0XFFCEAC6D), size: screenSize.width/25, weight: FontWeight.w600),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}