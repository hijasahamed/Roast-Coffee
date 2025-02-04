import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/splash_screen_controller.dart';
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
  void initState(){
    Provider.of<SplashProvider>(context, listen: false).checkUserStatus(context: context,screenSize: widget.screenSize);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF777646), 
      body: Stack(
        children: [
          BackgroundWidget(screenSize: widget.screenSize,),
          LogoWidget(screenSize: widget.screenSize,),
          Text('splash screen',style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}