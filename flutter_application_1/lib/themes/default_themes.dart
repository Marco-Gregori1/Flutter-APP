// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class DefaultThemes {
  static const Color marvelDarkest = Color.fromRGBO(36, 36, 36, 1);
  static const Color marvelDarker = Color.fromRGBO(43, 43, 43, 1);
  static const Color marvelDark = Color.fromRGBO(34, 34, 35, 1);
  static const Color marvelRed = Color.fromRGBO(254, 23, 31, 1);
  static const Color marvelWhite = Color.fromRGBO(223, 223, 233, 1);
  static const Color marvelGrey = Color.fromRGBO(176, 176, 176, 1);


    static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: marvelDarkest,
    primaryColor: marvelRed,
    backgroundColor: marvelWhite,
    appBarTheme: const AppBarTheme(
        backgroundColor: marvelRed, foregroundColor: marvelRed),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: marvelDark, foregroundColor: Colors.white)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: marvelDark, foregroundColor: marvelWhite),
    listTileTheme: const ListTileThemeData(iconColor: marvelRed),
  );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    //colorScheme: const ColorScheme(brightness: Brightness.dark, primary: Colors.blue, onPrimary: Colors.blue, secondary: Colors.blue, onSecondary: Colors.blue, error: Colors.blue, onError: Colors.blue, background: Colors.red, onBackground: Colors.blue, surface: Colors.blue, onSurface: Colors.blue),
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: marvelDarker,
    brightness: Brightness.dark,
    primaryColor: Colors.black, 
    hintColor: Colors.white,
    //textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black),bodyText1: TextStyle(color: marvelRed)),
    appBarTheme: const AppBarTheme(
        backgroundColor: marvelDarker, foregroundColor: marvelRed),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: marvelDark, foregroundColor: Colors.white)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: marvelDark, foregroundColor: marvelWhite),
    listTileTheme: const ListTileThemeData(iconColor: marvelRed),
  );

}