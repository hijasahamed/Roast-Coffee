import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/login_screen_controller.dart';
import 'package:roast_coffee/controller/splash_screen_controller.dart';
import 'package:roast_coffee/view/screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: const RoastCoffeeApp(),
    ),
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: SplashScreen(screenSize: screenSize,),
    );
  }
}