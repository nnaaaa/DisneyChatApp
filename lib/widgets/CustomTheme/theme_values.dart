import 'package:flutter/material.dart';
import 'package:disneymobile/styles/responsive.dart';

/// ----  main Theme  ----
final mainPrimary = Color(0xFF6768AB);
final mainAccent = Color.fromARGB(127, 241, 239, 239);
final mainBackground = Color.fromRGBO(255, 255, 255, 1);
final mainTheme = ThemeData(
    primaryColor: mainPrimary,
    accentColor: mainAccent,
    backgroundColor: mainBackground,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: mainAccent, primary: mainPrimary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(mainTheme.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
    ));

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFADC6FF),
  onPrimary: Color(0xFF002E69),
  secondary: Color(0xFFBBC6E4),
  onSecondary: Color(0xFF253048),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  background: Color(0xFF1B1B1F),
  onBackground: Color(0xFFE3E2E6),
  surface: Color(0xFF1B1B1F),
  onSurface: Color(0xFFE3E2E6),
);

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: Color.fromARGB(255, 174, 41, 41),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);
