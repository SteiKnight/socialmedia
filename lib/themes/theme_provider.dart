import 'package:flutter/material.dart';
import 'package:socialmedia/themes/dark_mode.dart';
import 'package:socialmedia/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = darkMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  bool get isDarkMode => themeData == darkMode;

  void toggleTheme() {
    if (isDarkMode) {
      themeData = lightMode;
      notifyListeners();
    } else {
      themeData = darkMode;
      notifyListeners();
    }
  }
}
