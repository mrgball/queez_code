import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme =>
      GoogleFonts.baloo2TextTheme(Theme.of(this).textTheme);
}

extension AppColors on BuildContext {
  Color get pinkLight => const Color(0xFFFFC6E0);
  Color get tealGreen => const Color(0xFF1F7C76);
  Color get textDark => const Color(0xFF3B3B3B);
  Color get mintGreen => const Color(0xFF8CE0D4);
  Color get pinkBubble => const Color(0xFFF98BBD);
  Color get yellowSoft => const Color(0xFFFFD76D);
}

extension MediaQuerySizeExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // Optional: useful fractions
  double get halfWidth => screenWidth / 2;
  double get thirdWidth => screenWidth / 3;
  double get quarterWidth => screenWidth / 4;

  double get halfHeight => screenHeight / 2;
  double get thirdHeight => screenHeight / 3;
  double get quarterHeight => screenHeight / 4;
}
