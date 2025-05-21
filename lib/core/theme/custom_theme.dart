import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static TextTheme textTheme = GoogleFonts.baloo2TextTheme();

  static ThemeData themeData = ThemeData(
    textTheme: textTheme,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
    useMaterial3: true,
  );
}
