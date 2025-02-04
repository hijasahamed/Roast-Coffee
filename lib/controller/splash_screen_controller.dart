import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


const logedInKey = 'Userlogedin';

class SplashProvider extends ChangeNotifier {

  Future<void> checkUserStatus({context, screenSize}) async {
    final sharedPref = await SharedPreferences.getInstance();
    final isLogedin = sharedPref.getBool(logedInKey);
    await Future.delayed(const Duration(milliseconds: 1800));
    
    if (isLogedin == true) {
      Navigator.pushNamedAndRemoveUntil(context, '/bottomnav', (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }
}
