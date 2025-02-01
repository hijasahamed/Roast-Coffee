import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class OrderRewardTile extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  final Size screenSize;

  const OrderRewardTile({super.key, 
    required this.icon,
    required this.title,
    required this.value,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          icon,
          fit: BoxFit.cover,
          height: screenSize.width / 12,
          width: screenSize.width / 12,
        ),
        SizedBox(width: screenSize.height * 0.007),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text: title, color: Colors.white, size: screenSize.width * 0.036, weight: FontWeight.w400),
            SizedBox(height: screenSize.height * 0.003),
            TextWidget(text: value, color: Colors.white, size: screenSize.width * 0.045, weight: FontWeight.bold),
          ],
        ),
      ],
    );
  }
}