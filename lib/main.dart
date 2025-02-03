import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/bottom_nav_controller.dart';
import 'package:roast_coffee/controller/home_screen_controller.dart';
import 'package:roast_coffee/controller/login_screen_controller.dart';
import 'package:roast_coffee/controller/splash_screen_controller.dart';
import 'package:roast_coffee/view/screens/bottom_nav_screen.dart';
import 'package:roast_coffee/view/screens/cart_screen.dart';
import 'package:roast_coffee/view/screens/login_screen.dart';
import 'package:roast_coffee/view/screens/splash_screen.dart';
import 'package:roast_coffee/view/screens/unknown_screen.dart';
import 'package:roast_coffee/view/screens/view_all_screen.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
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
        textTheme: GoogleFonts.outfitTextTheme(),
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => SplashScreen(screenSize: screenSize));          
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginScreen(screenSize: screenSize));
          case '/bottomnav':
            return MaterialPageRoute(builder: (context) => BottomNavScreen(screenSize: screenSize,));
          case '/viewAll':
            return MaterialPageRoute(builder: (context) => ViewAllScreen(screenSize: screenSize,));
          case '/cart':
            return MaterialPageRoute(builder: (context) => CartScreen(screenSize: screenSize));
          default:
            return MaterialPageRoute(builder: (context) => UnKnownRouteScreen());
        }
      },
    );
  }
}