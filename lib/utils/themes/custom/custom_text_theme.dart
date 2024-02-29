import 'package:flutter/material.dart';
import 'package:wolly_team/utils/constants/constant_colors.dart';

class CustomTextTheme {
  static final lightTheme = TextTheme(
    labelSmall: _customStyle(
      16,
      FontWeight.normal,
      ConstantColors.TEXT_BODY_LIGHT,
    ),
    labelMedium: _customStyle(
      18,
      FontWeight.bold,
      ConstantColors.TEXT_BODY_LIGHT,
    ),
    labelLarge: _customStyle(
      20,
      FontWeight.bold,
      ConstantColors.TEXT_BODY_LIGHT,
    ),
    bodySmall: _customStyle(
      18,
      FontWeight.normal,
      ConstantColors.TEXT_BODY_LIGHT,
    ),
    bodyMedium: _customStyle(
      20,
      FontWeight.bold,
      ConstantColors.TEXT_BODY_LIGHT,
    ),
    bodyLarge: _customStyle(
      22,
      FontWeight.bold,
      ConstantColors.TEXT_BODY_LIGHT,
    ),
    headlineSmall: _customStyle(
      22,
      FontWeight.normal,
      ConstantColors.TEXT_BODY_LIGHT,
    ),
    headlineMedium: _customStyle(
      24,
      FontWeight.bold,
      ConstantColors.TEXT_BODY_LIGHT,
    ),
    headlineLarge: _customStyle(
      26,
      FontWeight.bold,
      ConstantColors.TEXT_BODY_LIGHT,
    ),
  );
  static final darkTheme = TextTheme(
    labelSmall: _customStyle(
      16,
      FontWeight.normal,
      ConstantColors.TEXT_BODY_DARK,
    ),
    labelMedium: _customStyle(
      18,
      FontWeight.bold,
      ConstantColors.TEXT_BODY_DARK,
    ),
    labelLarge: _customStyle(
      20,
      FontWeight.bold,
      ConstantColors.TEXT_BODY_DARK,
    ),
    bodySmall: _customStyle(
      18,
      FontWeight.normal,
      ConstantColors.TEXT_BODY_DARK,
    ),
    bodyMedium: _customStyle(
      20,
      FontWeight.bold,
      ConstantColors.TEXT_BODY_DARK,
    ),
    bodyLarge: _customStyle(
      22,
      FontWeight.bold,
      ConstantColors.TEXT_BODY_DARK,
    ),
    headlineSmall: _customStyle(
      22,
      FontWeight.normal,
      ConstantColors.TEXT_BODY_DARK,
    ),
    headlineMedium: _customStyle(
      24,
      FontWeight.bold,
      ConstantColors.TEXT_BODY_DARK,
    ),
    headlineLarge: _customStyle(
      26,
      FontWeight.bold,
      ConstantColors.TEXT_BODY_DARK,
    ),
  );

  static _customStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
