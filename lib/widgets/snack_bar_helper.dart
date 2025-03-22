import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showSnackBar(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 2),
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(message),
        duration: duration,
      ),
    );
  }
}