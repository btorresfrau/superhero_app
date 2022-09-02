import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData light = _buildLightTheme();
  static final ThemeData dark = _buildDarkTheme();

  static ThemeData _buildLightTheme() {
    final ThemeData base = ThemeData.light();
    return base;
  }

  static ThemeData _buildDarkTheme() {
    final ThemeData base = ThemeData.dark();
    return base;
  }
}