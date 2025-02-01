import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class WalletAddressWidget extends StatelessWidget {
  const WalletAddressWidget({
    super.key,
    required this.image,
    required this.subtitle,
    required this.title,
    required this.screenSize,
    required this.cardnum,
  });

  final String image;
  final String title;
  final String subtitle;
  final Size screenSize;
  final int cardnum;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: screenSize.width/80,bottom: screenSize.width/60 ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: screenSize.width / 12,
            width: screenSize.width / 12,
          ),
          SizedBox(width: screenSize.width * 0.035),
          Expanded( 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: title,
                  color: Color(0XFF356B69),
                  size: screenSize.width * 0.038,
                  weight: FontWeight.w500,
                ),
                SizedBox(height: screenSize.height * 0.003),
                TextWidget(
                  text: subtitle,
                  color: Color(0XFF356B69),
                  size: cardnum == 2
                      ? screenSize.width * 0.032
                      : screenSize.width * 0.045,
                  weight: cardnum == 2 ? FontWeight.w100 : FontWeight.w600,
                  maxline: true,
                ),
              ],
            ),
          ),
          Container(
            height: screenSize.width / 18,
            width: screenSize.width / 18,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0XFFCEAC6D), width: 1.5),
              borderRadius: BorderRadius.circular(screenSize.width / 45),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                size: screenSize.width/30,
                color: Color(0XFFCEAC6D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}