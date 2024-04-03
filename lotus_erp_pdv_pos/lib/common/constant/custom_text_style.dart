import 'package:flutter/material.dart';

abstract class CustomTextStyles {
  static TextStyle blackBoldStyle(double fontSize) {
    return TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontSize);
  }

  static TextStyle whiteBoldStyle(double fontSize) {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: fontSize);
  }
}
