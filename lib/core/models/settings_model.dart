import 'package:flutter/cupertino.dart';

class SettingsModel extends ChangeNotifier {
  bool isDark = false; // todo: localy store theme mode
  int currencyIndex = 0;
  int languageIndex = 0;

  void toggleMode() {
    isDark = !isDark;
    notifyListeners();
  }

  void setCurrency(int index) {
    currencyIndex = index;
    notifyListeners();
  }

  void setLang(int index) {
    languageIndex = index;
    notifyListeners();
  }
}
