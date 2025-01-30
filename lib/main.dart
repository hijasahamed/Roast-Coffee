import 'package:flutter/material.dart';
import 'package:roast_coffee/view/screens/splash_screen.dart';

void main() {
  runApp(const RoastCoffeeApp());
}

class RoastCoffeeApp extends StatelessWidget {
  const RoastCoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return MaterialApp(
      title: 'Roast Coffee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(screenSize: screenSize,),
    );
  }
}