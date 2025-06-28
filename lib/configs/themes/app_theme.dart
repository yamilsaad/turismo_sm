import 'package:flutter/material.dart';

/// Temas personalizados para la aplicación Turismo San Martín.
class AppTheme {
  /// Tema claro principal
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff8FD14F),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff8FD14F),
      brightness: Brightness.light,
    ),
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffEAFAEA),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xff000000)),
      titleTextStyle: TextStyle(
        color: Color(0xff000000),
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xffEAFAEA),
      foregroundColor: Color(0xff365E32),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.w500, color: Color(0xff000000)),
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w500, color: Color(0xff000000)),
      headlineSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xff000000)),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
      bodySmall: TextStyle(fontSize: 12, color: Colors.black54),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xff8FD14F),
      textTheme: ButtonTextTheme.primary,
    ),
  );

  /// Tema oscuro opcional
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff604CC3),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff604CC3),
      brightness: Brightness.dark,
    ),
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: const Color(0xff232323),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff232323),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xff8FD14F)),
      titleTextStyle: TextStyle(
        color: Color(0xff8FD14F),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff604CC3),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xff8FD14F)),
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff8FD14F)),
      headlineSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xff8FD14F)),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
      bodySmall: TextStyle(fontSize: 12, color: Colors.white54),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xff604CC3),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
