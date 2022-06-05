import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  setTheme({required bool turnOn}) {
    isDark = turnOn;
    notifyListeners();
  }
}
