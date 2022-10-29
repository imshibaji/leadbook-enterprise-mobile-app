import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightMode() => ThemeData.from(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.indigo,
          onPrimary: Color.fromARGB(255, 226, 255, 248),
          secondary: Colors.teal,
          onSecondary: Colors.tealAccent,
          error: Colors.red,
          onError: Colors.redAccent,
          background: Colors.white,
          onBackground: Colors.white,
          surface: Colors.green.shade50,
          onSurface: Colors.indigoAccent.shade400,
        ),
      );

  static ThemeData darkMode() => ThemeData.from(
        colorScheme: ColorScheme.dark(
          primary: Color(0xFFF7D716),
          onPrimary: Color(0xFF293462),
          secondary: Color(0xFFEC9B3B),
          onSecondary: Color(0xFFF24C4C),
          background: Color.fromARGB(255, 32, 33, 37),
          onBackground: Color.fromARGB(255, 79, 98, 175),
          shadow: Color.fromARGB(255, 79, 98, 175),
        ),
      );
}
