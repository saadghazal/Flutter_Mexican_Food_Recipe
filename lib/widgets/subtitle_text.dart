import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText(
      {required this.label,
      this.fontWeight = FontWeight.w400,
      required this.textColor,
        this.fontSize = 12,

      super.key,});
  final String label;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        color:textColor,
        fontWeight: fontWeight,

      ),
    );
  }
}
