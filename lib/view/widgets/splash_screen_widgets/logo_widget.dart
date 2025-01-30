import 'package:flutter/material.dart';
import 'package:roast_coffee/view/screens/splash_screen.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.widget,
  });

  final SplashScreen widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/splash icon.png',
        fit: BoxFit.fill,
        width: widget.screenSize.width/2,
        height: widget.screenSize.width/4,
      ),
    );
  }
}