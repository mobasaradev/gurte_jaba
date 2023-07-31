import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  AppTextTheme._();
  static final _textStyle = GoogleFonts.poppins();

  static TextTheme common = TextTheme(
    headlineLarge: _textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.black,
    ),
    headlineMedium: _textStyle.copyWith(
      fontSize: 30,
      color: Colors.black54,
    ),
    bodyMedium: _textStyle.copyWith(
      fontSize: 16,
      color: Colors.black54,
    ),
    bodySmall: _textStyle.copyWith(
      fontSize: 14,
      color: Colors.black54,
    ),
  );
}
