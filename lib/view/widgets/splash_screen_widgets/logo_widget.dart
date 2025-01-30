import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/splash icon.png',
        fit: BoxFit.fill,
        width: screenSize.width/2,
        height: screenSize.width/4,
      ),
    );
  }
}