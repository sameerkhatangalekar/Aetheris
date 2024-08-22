import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Palette.scaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.white),
      color: Palette.scaffoldBackgroundColor,
      titleTextStyle: const TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: const TextStyle(color: Colors.white70),
      filled:true,
      labelStyle: const TextStyle(color: Colors.white70),
      fillColor: Colors.grey.shade900.withOpacity(0.8),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide:
        const BorderSide(color: Colors.white12, width: 0.5),
      ),

      errorStyle: const TextStyle(color: Colors.redAccent),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide:
        const BorderSide(color: Colors.redAccent, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide:
        const BorderSide(color: Colors.redAccent, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide:
        const BorderSide(color: Colors.white70, width: 0.5),
      ),

    ),
    primaryColor: Colors.black,
    fontFamily: 'Inter',
    useMaterial3: true,
  );
}

class Palette {
  static final scaffoldBackgroundColor = Colors.grey.shade900.withOpacity(0.1);
  static final backgroundColor = Colors.grey.shade900.withOpacity(0.4);
  static const titleColor = Colors.white;
  static const subTitleColor = Colors.white54;
}
