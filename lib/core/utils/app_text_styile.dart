import 'package:dish_it/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _textStyle(
  Color color,
  double fontSize,
  FontWeight fontWeight,
) {
  return GoogleFonts.lato(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

// Bold style
TextStyle boldStyle({
  Color color = AppColors.secondaryBlackColor,
  double fontSize = 24,
}) =>
    _textStyle(
      color,
      fontSize,
      FontWeight.bold,
    );

// Regular style
TextStyle regularStyle({
  Color color = AppColors.secondaryBlackColor,
  double fontSize = 24,
}) =>
    _textStyle(
      color,
      fontSize,
      FontWeight.normal,
    );
