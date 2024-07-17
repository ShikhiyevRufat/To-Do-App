import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/app_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData) {
    _loadTheme();
  }

  ThemeData get themeData => _themeData;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    _saveTheme(themeData);
    notifyListeners();
  }

  Future<void> _saveTheme(ThemeData themeData) async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = _getThemeIndex(themeData);
    prefs.setInt('themeIndex', themeIndex);
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('themeIndex') ?? 0;
    _themeData = getThemeData(themeIndex);
    notifyListeners();
  }

  int _getThemeIndex(ThemeData themeData) {
    if (themeData.colorScheme == AppTheme.orangeColorScheme) return 1;
    if (themeData.colorScheme == AppTheme.brownColorScheme) return 2;
    if (themeData.colorScheme == AppTheme.yellowColorScheme) return 3;
    if (themeData.colorScheme == AppTheme.greenColorScheme) return 4;
    if (themeData.colorScheme == AppTheme.pinkColorScheme) return 5;
    return 0; 
  }

  ThemeData getThemeData(int index) {
    switch (index) {
      case 1:
        return ThemeData(colorScheme: AppTheme.orangeColorScheme);
      case 2:
        return ThemeData(colorScheme: AppTheme.brownColorScheme);
      case 3:
        return ThemeData(colorScheme: AppTheme.yellowColorScheme);
      case 4:
        return ThemeData(colorScheme: AppTheme.greenColorScheme);
      case 5:
        return ThemeData(colorScheme: AppTheme.pinkColorScheme);
      default:
        return ThemeData(colorScheme: AppTheme.blueColorScheme);
    }
  }
}
