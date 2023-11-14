import 'package:animation_tween/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightTheme;

  get themeData => _themeData;
  set themeData(themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void switchTheme() {
    _themeData == lightTheme ? themeData = darkTheme : themeData = lightTheme;
  }
}
