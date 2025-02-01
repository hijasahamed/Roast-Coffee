import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


const logedInKey = 'Userlogedin';

class SplashProvider extends ChangeNotifier {

  Future<void> checkUserStatus({context, screenSize}) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    final sharedPref = await SharedPreferences.getInstance();
    final isLogedin = sharedPref.getBool(logedInKey);
    
    if (isLogedin == true) {
      Navigator.pushNamedAndRemoveUntil(context, '/bottomnav', (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }
}
