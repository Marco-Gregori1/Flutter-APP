import 'package:flutter/material.dart';

import 'package:flutter_application_1/themes/default_themes.dart';


class ThemeProvider extends ChangeNotifier {
  
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkMode}):currentTheme = (isDarkMode) ? ThemeData.dark() : ThemeData.light();

  setLight(){
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDark(){
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}
