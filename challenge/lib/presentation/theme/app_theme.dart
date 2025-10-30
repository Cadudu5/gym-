import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildDarkTheme() {
  const scheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF00E676),
    onPrimary: Color(0xFF003314),
    primaryContainer: Color(0xFF014D26),
    onPrimaryContainer: Color(0xFFB9F6CA),
    secondary: Color(0xFFFF9100),
    onSecondary: Color(0xFF2C1500),
    secondaryContainer: Color(0xFF4D2600),
    onSecondaryContainer: Color(0xFFFFD7B5),
    tertiary: Color(0xFF00BFA5),
    onTertiary: Color(0xFF003730),
    tertiaryContainer: Color(0xFF004F44),
    onTertiaryContainer: Color(0xFF3CFCD4),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: Color(0xFF121212),
    onSurface: Color(0xFFE6E6E6),
    surfaceTint: Color(0xFF00E676),
    outline: Color(0xFF8A8A8A),
    shadow: Colors.black,
    scrim: Colors.black,
    surfaceContainerHighest: Color(0xFF1F1F1F),
    onSurfaceVariant: Color(0xFFB0B0B0),
    inverseSurface: Color(0xFFE6E6E6),
    onInverseSurface: Color(0xFF1F1F1F),
    inversePrimary: Color(0xFF00C853),
  );

  final base = ThemeData(
    colorScheme: scheme,
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: scheme.surface,
    textTheme: GoogleFonts.interTextTheme(
      ThemeData(brightness: Brightness.dark).textTheme,
    ),
  );

  return base.copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      elevation: 0,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: scheme.secondaryContainer,
      contentTextStyle: TextStyle(color: scheme.onSecondaryContainer),
    ),
  );
}

ThemeData buildLightTheme() {
  final dark = buildDarkTheme();
  return dark.copyWith(brightness: Brightness.dark);
}
