import 'package:flutter/material.dart';
import 'package:wolly_team/utils/constants/constant_colors.dart';

class CustomElevatedButtonTheme {
  static final lightTheme = ElevatedButtonThemeData(
    style: _customButtonStyle(
      ConstantColors.BUTTON_BG_LIGHT,
      ConstantColors.TEXT_HEADER_DARK,
    ),
  );

  static final darkTheme = ElevatedButtonThemeData(
    style: _customButtonStyle(
      ConstantColors.BUTTON_BG_DARK,
      ConstantColors.TEXT_HEADER_LIGHT,
    ),
  );

  static ButtonStyle _customButtonStyle(
    Color backgroundColor,
    Color foregroundColor,
  ) {
    return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(backgroundColor),
      foregroundColor: MaterialStatePropertyAll(foregroundColor),
    );
  }
}
