import 'package:flutter/material.dart';

TextStyle myTextStyle = const TextStyle(
  fontFamily: 'CustomFont',
);
ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  colorScheme: ColorScheme.light(
    background: Colors.grey[300] as Color,
    primary: Colors.white,
    secondary: Colors.grey,
  ),
  textTheme: TextTheme(
      bodyMedium: myTextStyle,
      bodyLarge: myTextStyle,
      bodySmall: myTextStyle,
      headlineMedium: myTextStyle,
      headlineLarge: myTextStyle,
      headlineSmall: myTextStyle,
      titleMedium: myTextStyle,
      titleLarge: myTextStyle,
      titleSmall: myTextStyle,
      labelMedium: myTextStyle,
      labelLarge: myTextStyle,
      labelSmall: myTextStyle

      // Add other text styles as needed
      ),
);
