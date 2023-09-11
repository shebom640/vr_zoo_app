import 'package:flutter/material.dart';

class CustomColor{
  static Color get primary => const Color(0xFFff4165);
  static Color get light => const Color(0xFFffffff);
  static Color get textColorLight => const Color(0xFFffffff);
  static Color get textColorPrimary => const Color(0xFFff4165);
  static Color get textColorDark => const Color(0xFF000000);
  static Color get textColorGray => Colors.grey.shade700;
  static Color get darkTextColor => const Color(0xFF2e2e2e);
  static Color get lightTextColor => const Color(0xFFffffff);
  static Color get pageBackground => const Color(0xFFf3f6fc);
  static Color get border => const Color(0xFFbfc6d7);
  static Color get error => Colors.red.shade600;
  static Color get pending => Colors.amber.shade700;
  static Color get success => Colors.green.shade700;
}

class CustomPrimaryColor {
  CustomPrimaryColor._();

  static const _PrimaryValue = 0xFFff4165;

  static const MaterialColor primary = MaterialColor(
      _PrimaryValue, <int, Color>{
    50:  Color(0xFFffe8ed),
    100: Color(0xFFffc6d1),
    200: Color(0xFFFFA0B2),
    300: Color(0xFFff7a93),
    400: Color(0xFFff5e7c),
    500: Color(_PrimaryValue),
    600: Color(0xFFff3b5d),
    700: Color(0xFFff3253),
    800: Color(0xFFff2a49),
    900: Color(0xFFff1c37),
  });
}


LinearGradient gradientCardBackground = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: <Color>[
    Color(0xFF181818),
    Colors.black
  ],
);