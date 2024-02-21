import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/colors.dart';

class AppTextStyles {
  static TextStyle headerTextStyle({required color, double fontSize = 18}) {
    return GoogleFonts.signikaNegative(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle montserratStyle({required color, double fontSize = 24}) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle headingStyles(
      {double fontSize = 36, Color color = Colors.white}) {
    return GoogleFonts.rubikMoonrocks(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      color: color,
      letterSpacing: 2,
    );
  }

  static TextStyle normalStyles({double fontSize = 16}) {
    return GoogleFonts.signikaNegative(
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      letterSpacing: 1.5,
      color: AppColor.white,
    );
  }
}
