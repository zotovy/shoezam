import 'package:flutter/cupertino.dart';

class ThemeModel extends ChangeNotifier {
  bool isDark = false; // todo: localy store theme mode

  void toggleMode() {
    isDark = !isDark;
    notifyListeners();
  }
}
