  
  import 'package:flutter/material.dart';
  
  void showSnackBarss(BuildContext context, String message,
      {MaterialColor? background_color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: background_color,
        content: Text(message),
      ),
    );
  }