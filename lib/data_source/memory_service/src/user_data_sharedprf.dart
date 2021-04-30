import 'package:shared_preferences/shared_preferences.dart';

class UserDataSharedPref {
  UserDataSharedPref._();

  static final UserDataSharedPref sharedPrf = UserDataSharedPref._();

  final String userDataKey = "IslamicTriviaData";

  Future<bool> setUserPoints(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setInt(userDataKey, value);
  }

  Future<int> getUserPoints() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(userDataKey);
  }

  Future<bool> setUserCompletedLevelPoints(List<String> value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setStringList("level points", value);
  }

  Future<bool> setUnlockedLevels(String level) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(level, level);
  }

  Future<List> getLevelPoints() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList("level points");
  }

  Future<String> getUserUnlockedLevels(String level) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(level);
  }
}
