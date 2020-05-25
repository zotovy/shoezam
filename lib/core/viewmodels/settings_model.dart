import 'package:provider/provider.dart';
import 'package:shoezam/core/models/settings_model.dart';
import 'package:shoezam/core/viewmodels/base_model.dart';

class SettingsViewModel extends BaseViewModel {
  bool isDark;
  int currencyIndex;
  int languageIndex;

  Future setup(context) async {
    SettingsModel _settings = Provider.of<SettingsModel>(
      context,
      listen: false,
    );
    isDark = _settings.isDark;
    currencyIndex = _settings.currencyIndex;
    languageIndex = _settings.languageIndex;
  }

  void toggleThemeMode(context) {
    isDark = !isDark;
    Provider.of<SettingsModel>(
      context,
      listen: false,
    ).toggleMode();
  }

  void setCurrency(context, int index) {
    currencyIndex = index;
    Provider.of<SettingsModel>(
      context,
      listen: false,
    ).setCurrency(index);
  }

  void setLanguage(context, int index) {
    languageIndex = index;
    Provider.of<SettingsModel>(
      context,
      listen: false,
    ).setLang(index);
  }
}
