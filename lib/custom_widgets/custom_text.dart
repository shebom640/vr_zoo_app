import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(this. text, {this.color, this. fontWeight, this.textAlign, this.fontSize, this.height, this.isTitle, this.maxLines, this.letterSpacing});

  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final double? fontSize;
  final double? height;
  final bool? isTitle;
  final int? maxLines;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize ?? FontSizes.s16,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color,
          height: height,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
        )
    );
  }
}

class FontSizes {
  static double get scale => 1;
  /// ---- Values for Font Sizes
  static double get s8 => 8 * scale;
  static double get s9 => 9 * scale;
  static double get s10 => 10 * scale;
  static double get s11 => 11 * scale;
  static double get s12 => 12 * scale;
  static double get s13 => 13 * scale;
  static double get s14 => 14 * scale;
  static double get s15 => 15 * scale;
  static double get s16 => 16 * scale;
  static double get s18 => 18 * scale;
  static double get s20 => 20 * scale;
  static double get s22 => 22 * scale;
  static double get s24 => 24 * scale;
  static double get s26 => 26 * scale;
  static double get s28 => 28 * scale;
  static double get s30 => 30 * scale;
  static double get s32 => 32 * scale;
  static double get s34 => 34 * scale;
  static double get s36 => 36 * scale;
  static double get s38 => 38 * scale;
}