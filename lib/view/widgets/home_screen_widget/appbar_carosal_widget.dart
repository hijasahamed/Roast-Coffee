import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class AppbarCarosalContentWidget extends StatelessWidget {
  const AppbarCarosalContentWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0XFFF5F5F5),
          height: screenSize.height/2.8,
        ),
        Container(
          height: screenSize.height/3.5,
          decoration: BoxDecoration(
            color: Color(0XFF356B69),
            image: DecorationImage(image: AssetImage('assets/images/transparent frame.png'),fit: BoxFit.cover)
          ),
        ),
        Positioned(
          top: screenSize.height/30,
          child: Padding(
            padding: EdgeInsets.all(screenSize.width/25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: screenSize.width/49,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width/1.8,
                      child: TextWidget(text: 'What are you craving today?', color: Colors.white, size: screenSize.width/20, weight: FontWeight.w600,maxline: true,)
                    ),
                    SizedBox(width: screenSize.width/3.6,),
                    Image.asset('assets/images/settings icon.png',fit: BoxFit.cover,height: screenSize.width/15,width: screenSize.width/15,)
                  ],
                ),
                Row(
                  spacing: screenSize.width/45,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/tabler-icon-current-location.png',fit: BoxFit.cover,height: screenSize.width/20,width: screenSize.width/20,),
                    TextWidget(text: ' 19290  Al Fateh Grand Mosque Road, Bahrain', color: Colors.white, size: screenSize.width/32, weight: FontWeight.w600,maxline: true,),
                    Image.asset('assets/images/tabler-icon-circle-chevron-down.png',fit: BoxFit.cover,height: screenSize.width/20,width: screenSize.width/20,),
                  ],
                ),
                Container(
                  height: screenSize.height/17,
                  width: screenSize.width/1.1,
                  padding: EdgeInsets.only(left: screenSize.width/30,right: screenSize.width/30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenSize.width/50)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: 'What are you looking for ?', color: Color(0XFF6E8382), size: screenSize.width/26, weight: FontWeight.w500,maxline: true,),
                      Image.asset('assets/images/tabler-icon-adjustments-horizontal.png',fit: BoxFit.cover,height: screenSize.width/18,width: screenSize.width/18,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CarouselSlider(
            options: CarouselOptions(
              height: screenSize.height/8,
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 16 / 4,
              viewportFraction: 0.6,
            ),
            items: [
              'assets/images/browniee.jpeg',
              'assets/images/image 8.png',
              'assets/images/cheescake.jpeg'
            ].map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: screenSize.width * 0.8,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}