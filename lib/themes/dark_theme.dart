import 'package:flutter/material.dart';

TextStyle myTextStyle = const TextStyle(
  fontFamily: 'CustomFont',
);
ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  colorScheme: ColorScheme.light(
    background: Color.fromARGB(66, 105, 95, 95),
    primary: Colors.black,
    secondary: Colors.black87,
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
