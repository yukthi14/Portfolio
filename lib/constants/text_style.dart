import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/colors.dart';

class AppTextStyles {
  static TextStyle headerTextStyle() {
    return GoogleFonts.signikaNegative(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColor.white,
    );
  }

  static TextStyle montserratStyle({required color}) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle headingStyles() {
    return GoogleFonts.rubikMoonrocks(
      fontWeight: FontWeight.bold,
      fontSize: 36,
      color: AppColor.white,
      letterSpacing: 2,
    );
  }

  static TextStyle normalStyles() {
    return GoogleFonts.signikaNegative(
      fontWeight: FontWeight.w500,
      fontSize: 17,
      letterSpacing: 1,
      color: AppColor.white,
    );
  }
}
