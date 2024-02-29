import 'package:flutter/material.dart';
import 'package:wolly_team/utils/constants/constant_colors.dart';

class CustomColorScheme {
  static const lightTheme = ColorScheme.light(
    primary: ConstantColors.blumine,
    secondary: ConstantColors.perano,
  );
  static const darkTheme = ColorScheme.dark(
    primary: ConstantColors.perano,
    secondary: ConstantColors.blumine,
  );
}
