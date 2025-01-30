import 'package:flutter/material.dart';
import 'package:roast_coffee/view/screens/login_screen.dart';

class SplashProvider extends ChangeNotifier {

  Future<void> checkUserStatus({context,screenSize}) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return LoginScreen(screenSize: screenSize,);
        },
      ),
    );
  }

}
