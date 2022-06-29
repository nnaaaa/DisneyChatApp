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
          backgroundColor: MaterialStateProperty.all(mainPrimary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
    ));
