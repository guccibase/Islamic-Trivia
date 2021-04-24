import 'package:flutter/material.dart';

class PageViewHolder extends ChangeNotifier {
  double value;
  PageViewHolder(this.value);

  void setValue(double newVal) {
    value = newVal;
    notifyListeners();
  }
}