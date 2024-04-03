// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onPressed;
  final TextStyle style;
  double? radious;

  CustomElevatedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.style,
    this.radious = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radious!),
          ),
          backgroundColor: color),
      onPressed: onPressed,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
