import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class RewardBodyContentWidget extends StatelessWidget {
  const RewardBodyContentWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: screenSize.width * 0.07,right: screenSize.width * 0.07),
      padding: EdgeInsets.only(left: screenSize.width/18,right: screenSize.width/18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Congratulations Text
          TextWidget(
            text: "Congratulations!",
            color: Color(0XFFCEAC6D),
            size: screenSize.width * 0.06,
            weight: FontWeight.bold,
            alignTextCenter: true,
          ),
          SizedBox(height: screenSize.height * 0.004),
              
          // Subtext
          TextWidget(
            text: "You are now upgraded to Gold Tier!",
            color: Color(0XFF6E8382),
            size: screenSize.width * 0.04,
            weight: FontWeight.normal,
            alignTextCenter: true,
          ),
          SizedBox(height: screenSize.height * 0.03),
              
          // Image
          Image.asset(
            'assets/animation/20250204_120513.gif',
            width: screenSize.width * 0.6,
            height: screenSize.width * 0.4,
          ),
          SizedBox(height: screenSize.height * 0.03),
              
          // Benefit Description
          Padding(
            padding: EdgeInsets.only(left: screenSize.width * 0.04,right: screenSize.width * 0.04),
            child: TextWidget(
              text: "Access Loyalty Tier benefits and redeem it with ease",
              color: Color(0XFF6E8382),
              size: screenSize.width * 0.04,
              weight: FontWeight.normal,
              maxline: true,
              alignTextCenter: true,
            ),
          ),
          SizedBox(height: screenSize.height * 0.04),
              
          // Discount Text
          TextWidget(
            text: "Save upto",
            color: Color(0XFF6E8382),
            size: screenSize.width * 0.045,
            weight: FontWeight.normal,
            alignTextCenter: true,
          ),
              
          // 30% Text
          TextWidget(
            text: "30%",
            color: Color(0XFF356B69),
            size: screenSize.width * 0.11,
            weight: FontWeight.bold,
            alignTextCenter: true,
          ),
              
          // Discount Description
          TextWidget(
            text: "off on your next order",
            color: Color(0XFF6E8382),
            size: screenSize.width * 0.04,
            weight: FontWeight.normal,
            alignTextCenter: true,
          ),
          SizedBox(height: screenSize.height * 0.05),
              
          // Button
          Material(
            child: InkWell(
              onTap: () {
                
              },
              borderRadius: BorderRadius.circular(screenSize.width/35),
              child: Ink(
                padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.007),
                decoration: BoxDecoration(
                  color: Color(0XFFCEAC6D),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: TextWidget(
                    text: "Know more about your Benefits",
                    color: Colors.white,
                    size: screenSize.width * 0.04,
                    weight: FontWeight.bold,
                    alignTextCenter: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}