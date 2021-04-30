import 'package:flutter/cupertino.dart';

class UserData with ChangeNotifier {
  int _userPoints;

  int get getUserPoints => _userPoints;

  set setUserPoints(int value) {
    _userPoints = value;
  }
}
