import 'package:flutter/material.dart';
import 'package:flutter_weefit/product/init/theme/custom_color_scheme.dart';
import 'package:flutter_weefit/product/init/theme/custom_theme.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom dark theme for project design
final class CustomDarkTheme implements CustomTheme {
  // TODO: change to initialize ThemeData instead of computed
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: CustomColorScheme.darkColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();
}
