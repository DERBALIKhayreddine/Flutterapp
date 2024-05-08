import 'package:flutter/material.dart';

class MonTheme extends ChangeNotifier {
  static String mode = "Day";

  void setMode(String m) {
    mode = m;
    notifyListeners();
  }

  ThemeData getTheme() {
    return (mode == "Day") ? ThemeData.light() : ThemeData.dark();
  }
}
