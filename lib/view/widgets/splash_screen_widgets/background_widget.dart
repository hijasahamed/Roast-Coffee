import 'package:flutter/material.dart';
import 'package:roast_coffee/view/screens/splash_screen.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.widget,
  });

  final SplashScreen widget;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/splash screen.png',
      fit: BoxFit.cover,
      width: widget.screenSize.width,
      height: widget.screenSize.height,
    );
  }
}