import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/splash screen.png',
      fit: BoxFit.cover,
      width: screenSize.width,
      height: screenSize.height,
    );
  }
}