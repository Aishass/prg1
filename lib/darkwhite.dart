import 'package:flutter/material.dart';

class darklighgt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(); // Your widget code here
  }

  static bool isDarkMode(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  static bool isLightMode(BuildContext context) {
    return !isDarkMode(context);
  }
}
