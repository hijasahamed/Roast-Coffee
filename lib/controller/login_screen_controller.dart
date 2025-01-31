import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:roast_coffee/view/widgets/common_widgets/snackbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
    
    

class LoginProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController(); 
  final TextEditingController passwordController = TextEditingController(); 
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final String url = dotenv.env['LOGIN_API'].toString();
    final Map<String, String> headers = {"Content-Type": "application/json"};

    final Map<String, String> body = {
      "username": usernameController.text.trim(),
      "password": passwordController.text.trim(),
    };

    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("auth_token", responseData['auth_token'] ?? "");
          await prefs.setBool('Userlogedin',true);
          snackbarWidget('Login Successfull', context, Colors.green);

          // Navigate to Home Screen
          // Navigator.pushReplacementNamed(context, "/home");

      } else {
        // Server error
        snackbarWidget("Login Failed: ${response.statusCode}", context, Colors.red);
      }
    } catch (e) {
      snackbarWidget("Something went wrong: $e", context, Colors.red);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}