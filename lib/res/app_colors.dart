import 'package:flutter/material.dart';

class AppColors {
  static const Color lightPrimary = Color(0xffffffff);
  static const Color lightBackground = Color(0xffeeeeee);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color green = Colors.green;
  static const Color lightShadowColor = Colors.black12;
  static const Color lightCanvas = Color(0xffffffff);
  static const Color red = Color(0xffF24748);
  static const Color scaffoldColor = Color(0xFFE7E7E7);
  static const Color yellow = Color(0xffE6AE46);

  static const MaterialColor lightSecondaryAccent =
      MaterialColor(0xFF0d0845, purple);
  static const Map<int, Color> purple = {
    50: Color(0xff0d0845),
    100: Color(0xff0b073e),
    200: Color(0xff0a0637),
    300: Color(0xff090530),
    400: Color(0xff070429),
    500: Color(0xff060422),
    600: Color(0xff05031b),
    700: Color(0xff030214),
    800: Color(0xff02010d),
    900: Color(0xff010006),
  };

  static const MaterialColor lightPrimaryAccent =
      MaterialColor(0xFFF24748, pink);
  static const Map<int, Color> pink = {
    50: Color.fromRGBO(242, 71, 72, .1),
    100: Color.fromRGBO(242, 71, 72, .2),
    200: Color.fromRGBO(242, 71, 72, .3),
    300: Color.fromRGBO(242, 71, 72, .4),
    400: Color.fromRGBO(242, 71, 72, .5),
    500: Color.fromRGBO(242, 71, 72, .6),
    600: Color.fromRGBO(242, 71, 72, .7),
    700: Color.fromRGBO(242, 71, 72, .8),
    800: Color.fromRGBO(242, 71, 72, .9),
    900: Color.fromRGBO(242, 71, 72, 1),
  };
}
