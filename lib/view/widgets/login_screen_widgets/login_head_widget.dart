import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class LoginHeadWidget extends StatelessWidget {
  const LoginHeadWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: screenSize.width/35),
      child: Column(
        spacing: screenSize.width/50,
        children: [
          SizedBox(
            height: screenSize.width/5,
            width: screenSize.width/4.97,
            child: Image.asset('assets/images/login logo.png',fit: BoxFit.cover,)
          ),
          TextWidget(text: 'Login to your account', color: Colors.white, size: screenSize.width/19.5, weight: FontWeight.w800),
          TextWidget(text: 'Enter your details to login', color: Colors.white, size: screenSize.width/30, weight: FontWeight.w500),
        ],
      ),
    );
  }
}