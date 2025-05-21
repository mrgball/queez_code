import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme =>
      GoogleFonts.baloo2TextTheme(Theme.of(this).textTheme);
}

extension AppColors on BuildContext {
  // Base Colors
  Color get pinkLight => const Color(0xFFFFC6E0);
  Color get tealGreen => const Color(0xFF1F7C76);
  Color get textDark => const Color(0xFF3B3B3B);
  Color get mintGreen => const Color(0xFF8CE0D4);
  Color get pinkBubble => const Color(0xFFF98BBD);
  Color get yellowSoft => const Color(0xFFFFD76D);

  // Flavours - Light Variants
  Color get pinkLightLight => const Color(0xFFFFD9EC);
  Color get tealGreenLight => const Color(0xFF4FA89D);
  Color get textDarkLight => const Color(0xFF5E5E5E);
  Color get mintGreenLight => const Color(0xFFA9E9DE);
  Color get pinkBubbleLight => const Color(0xFFFBB1D4);
  Color get yellowSoftLight => const Color(0xFFFFE699);

  // Flavours - Dark Variants
  Color get pinkLightDark => const Color(0xFFE6ACC7);
  Color get tealGreenDark => const Color(0xFF14524E);
  Color get textDarkDark => const Color(0xFF222222);
  Color get mintGreenDark => const Color(0xFF65C6B7);
  Color get pinkBubbleDark => const Color(0xFFD871A0);
  Color get yellowSoftDark => const Color(0xFFD6B351);
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
