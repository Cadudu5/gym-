import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildLightTheme() {
  final base = ThemeData.from(colorScheme: _lightColorScheme);
  return base.copyWith(
    textTheme: GoogleFonts.interTextTheme(base.textTheme),
    useMaterial3: true,
  );
}

ThemeData buildDarkTheme() {
  final base = ThemeData.from(colorScheme: _darkColorScheme);
  return base.copyWith(
    textTheme: GoogleFonts.interTextTheme(base.textTheme),
    useMaterial3: true,
  );
}

const ColorScheme _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF00C853),
  onPrimary: Colors.white,
  primaryContainer: Color(0xFFB9F6CA),
  onPrimaryContainer: Color(0xFF003314),
  secondary: Color(0xFFFF6D00),
  onSecondary: Colors.white,
  secondaryContainer: Color(0xFFFFD180),
  onSecondaryContainer: Color(0xFF2D1600),
  tertiary: Color(0xFF424242),
  onTertiary: Colors.white,
  tertiaryContainer: Color(0xFFBDBDBD),
  onTertiaryContainer: Color(0xFF1C1C1C),
  error: Color(0xFFBA1A1A),
  onError: Colors.white,
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFF5F5F5),
  onBackground: Color(0xFF1C1C1C),
  surface: Colors.white,
  onSurface: Color(0xFF1C1C1C),
  surfaceVariant: Color(0xFFE0E0E0),
  onSurfaceVariant: Color(0xFF424242),
  outline: Color(0xFF757575),
  shadow: Colors.black,
  scrim: Colors.black,
  inverseSurface: Color(0xFF303030),
  onInverseSurface: Color(0xFFE0E0E0),
  inversePrimary: Color(0xFF00E676),
  surfaceTint: Color(0xFF00C853),
);

const ColorScheme _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF00E676),
  onPrimary: Color(0xFF003314),
  primaryContainer: Color(0xFF005323),
  onPrimaryContainer: Color(0xFFB9F6CA),
  secondary: Color(0xFFFF9100),
  onSecondary: Color(0xFF2D1600),
  secondaryContainer: Color(0xFF4D2600),
  onSecondaryContainer: Color(0xFFFFD180),
  tertiary: Color(0xFFBDBDBD),
  onTertiary: Color(0xFF1C1C1C),
  tertiaryContainer: Color(0xFF2E2E2E),
  onTertiaryContainer: Color(0xFFE0E0E0),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF121212),
  onBackground: Color(0xFFE0E0E0),
  surface: Color(0xFF1E1E1E),
  onSurface: Color(0xFFE0E0E0),
  surfaceVariant: Color(0xFF424242),
  onSurfaceVariant: Color(0xFFBDBDBD),
  outline: Color(0xFF9E9E9E),
  shadow: Colors.black,
  scrim: Colors.black,
  inverseSurface: Color(0xFFE0E0E0),
  onInverseSurface: Color(0xFF303030),
  inversePrimary: Color(0xFF00C853),
  surfaceTint: Color(0xFF00E676),
);
