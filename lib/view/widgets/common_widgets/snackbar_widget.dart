import 'package:flutter/material.dart';

snackbarWidget(String text, context,Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(milliseconds: 1500),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
    margin: const EdgeInsets.all(20),
    elevation: 5,
    content: Text(
      text,
      style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600),
    ),
  ));
}