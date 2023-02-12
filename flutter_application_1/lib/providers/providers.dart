import 'package:flutter/material.dart';

import 'package:flutter_application_1/themes/default_themes.dart';


class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool darkmodeEnabled})
      : currentTheme =
            (darkmodeEnabled) ? DefaultThemes.lightTheme : ThemeData.light();

  setDark() {
    currentTheme = DefaultThemes.lightTheme;
    notifyListeners();
  }

  setLight() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }
}
