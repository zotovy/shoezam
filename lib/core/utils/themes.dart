import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  fontFamily: "Inter",
  primaryColor: Color(0xFFA76C6E),
  backgroundColor: Color(0xFFFDFDFD),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xFF282828),
    ),
    headline2: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Color(0xFF282828),
    ),
  ),
  canvasColor: Colors.transparent,
  brightness: Brightness.light,
  accentColor: Colors.white,
  cursorColor: Color(0xFF282828),
);

ThemeData darkMode = ThemeData(
  fontFamily: "Inter",
  primaryColor: Color(0xFFA76C6E),
  backgroundColor: Color(0xFF282828),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xFFFDFDFD),
    ),
    headline2: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Color(0xFFFDFDFD),
    ),
  ),
  canvasColor: Colors.transparent,
  brightness: Brightness.dark,
  accentColor: Color(0xFF282828),
  cursorColor: Color(0xFFFDFDFD),
);
