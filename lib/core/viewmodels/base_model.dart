import 'package:flutter/cupertino.dart';
import 'package:shoezam/core/utils/enums.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState state;

  void setState(ViewState newState) {
    state = newState;
    notifyListeners();
  }
}
