import 'package:flutter/material.dart';
import 'package:project_template/app/locator.dart';
import 'package:project_template/caches/preferences.dart';

class ThemeProvider extends ChangeNotifier {
  Preferences preferences = locator<Preferences>();

  bool get darkTheme => preferences.darkMode();

  set darkTheme(bool value) {
    preferences.setDarkMode(value);
    notifyListeners();
  }
}
