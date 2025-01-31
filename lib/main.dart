import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/login_screen_controller.dart';
import 'package:roast_coffee/controller/splash_screen_controller.dart';
import 'package:roast_coffee/view/screens/home_screen.dart';
import 'package:roast_coffee/view/screens/login_screen.dart';
import 'package:roast_coffee/view/screens/splash_screen.dart';
import 'package:roast_coffee/view/screens/unknown_screen.dart';

void main() async {
  await dotenv.load(fileName: '.env');
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));
    return MaterialApp(
      title: 'Roast Coffee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => SplashScreen(screenSize: screenSize));
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginScreen(screenSize: screenSize));
          case '/home':
            return MaterialPageRoute(builder: (context) => HomeScreen(screenSize: screenSize,));
          default:
            return MaterialPageRoute(builder: (context) => UnKnownRouteScreen());
        }
      },
    );
  }
}