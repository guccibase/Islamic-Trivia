import 'package:flutter/material.dart';
import 'package:islamic_trivia/data_source/memory_service/src/theme_sharedprf.dart';
import 'package:islamic_trivia/themes/app_theme.dart';

class AppThemProvider extends ChangeNotifier {
  ThemeData _themeData = AppTheme.lightTheme;

  ThemeData get themeData => _themeData;
  AppThemProvider() {
    init();
  }

  init() async {
    int theme = await ThemeSharedPrf.sharedPrf.getTheme();
    if (theme == null) {
      _themeData = AppTheme.lightTheme;
    } else {
      _setTheme(theme);
    }
    notifyListeners();
  }

  Future<void> themeUpdate(int theme) async {
    _setTheme(theme);
    notifyListeners();

    await ThemeSharedPrf.sharedPrf.setTheme(theme);
  }

  _setTheme(int theme) {
    if (theme == 0) {
      _themeData = AppTheme.lightTheme;
    } else {
      _themeData = AppTheme.darkTheme;
    }
  }
}
