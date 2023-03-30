import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme customLightThemesTextTheme(TextTheme base) {
  return base.copyWith();
}

ThemeData customLightTheme() {
  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
      scaffoldBackgroundColor: const Color(0xFFFDF3E4),
      textTheme: GoogleFonts.jostTextTheme(lightTheme.textTheme));
}

ThemeData customDarkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
      //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      scaffoldBackgroundColor: const Color(0xFF0F0F0F),
      textTheme: GoogleFonts.jostTextTheme(darkTheme.textTheme));
}
