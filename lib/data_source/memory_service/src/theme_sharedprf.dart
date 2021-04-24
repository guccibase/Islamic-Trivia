import 'package:shared_preferences/shared_preferences.dart';

class ThemeSharedPrf {

  ThemeSharedPrf._();

  static final ThemeSharedPrf sharedPrf = ThemeSharedPrf._();

  final String appThemeKey = "APPTHEMEKEY";

  Future<bool> setTheme (int value)async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setInt(appThemeKey, value);
  }
  Future<int> getTheme ()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(appThemeKey);
  }

}