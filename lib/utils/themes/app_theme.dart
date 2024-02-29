import 'package:flutter/material.dart';
import 'package:wolly_team/utils/themes/custom/custom_color_scheme.dart';
import 'package:wolly_team/utils/themes/custom/custom_elevated_button_theme.dart';
import 'package:wolly_team/utils/themes/custom/custom_text_theme.dart';

class CustomAppTheme {
  static const _font = 'Open Sans';
  static final lightTheme = _customThemeData(
    CustomTextTheme.lightTheme,
    CustomElevatedButtonTheme.lightTheme,
    CustomColorScheme.lightTheme,
  );
  static final darkTheme = _customThemeData(
    CustomTextTheme.darkTheme,
    CustomElevatedButtonTheme.darkTheme,
    CustomColorScheme.darkTheme,
  );

  static _customThemeData(
    TextTheme textTheme,
    ElevatedButtonThemeData elevatedButtonTheme,
    ColorScheme colorScheme,
  ) {
    return ThemeData(
        fontFamily: _font,
        useMaterial3: true,
        textTheme: textTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        colorScheme: colorScheme,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        )
        // add mais configurações se for necessário
        );
  }
}
