import 'package:flutter/material.dart';


class TextCustom extends StatelessWidget {
  const TextCustom({
    super.key,
    required this.text,
  this.decorationColor,
    this.fontWeight,
    this.color ,
    this.fontSize = 20,
    this.decoration,
    this.height, this.maxLines, this.overflow, this.textAlign, this.fontStyle,
  });

  final String text;
  final double? height;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? decorationColor;
  final double? fontSize;
  final TextDecoration? decoration;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign:textAlign,
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
        decoration: decoration,
        decorationColor: decorationColor,
        fontFamily: "Cairo",
        height: height,
        fontStyle: fontStyle

      ),
    );
  }
}
