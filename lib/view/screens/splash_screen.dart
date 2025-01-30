import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/splash_screen_widgets/background_widget.dart';
import 'package:roast_coffee/view/widgets/splash_screen_widgets/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,required this.screenSize});
  final Size screenSize;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(widget: widget),
          LogoWidget(widget: widget)
        ],
      ),
    );
  }
}