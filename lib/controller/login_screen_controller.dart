import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login() async {
    final String url = "https://mt.diodeinfosolutions.com/api/login";
    final Map<String, String> headers = {"Content-Type": "application/json"};

    final Map<String, String> body = {
      "username": usernameController.text.trim(),
      "password": passwordController.text.trim(),
    };

    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData['success'] == true) {
          // Login successful - Handle token or session
          debugPrint("Login successful: ${responseData['token']}");
        } else {
          // API responded but login failed
          _errorMessage = responseData['message'] ?? "Login failed";
        }
      } else {
        // Server error
        _errorMessage = "Server error: ${response.statusCode}";
      }
    } catch (e) {
      _errorMessage = "Something went wrong: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}