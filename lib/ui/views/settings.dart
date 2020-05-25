import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:shoezam/core/utils/constants.dart';
import 'package:shoezam/core/viewmodels/settings_model.dart';
import 'package:shoezam/localization.dart';
import 'package:shoezam/locator.dart';
import 'package:shoezam/ui/widgets/settings/choose_dialog.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Model
  SettingsViewModel _model = locator<SettingsViewModel>();

  List<Widget> _ui(BuildContext context, SettingsViewModel model) {
    return [
      // Change theme icon
      GestureDetector(
        onTap: () => model.toggleThemeMode(context),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Icon(
            model.isDark ? Feather.sun : Feather.moon,
            color: Theme.of(context).cursorColor,
            size: 28,
          ),
        ),
      ),

      // Currency
      Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translate('currency:'),
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).cursorColor,
              ),
            ),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (_) => chooseDialog(
                  context,
                  onSelect: (int i) => model.setCurrency(context, i),
                  options: currency,
                  title:
                      AppLocalizations.of(context).translate('choose_currency'),
                ),
              ),
              child: Text(
                currency[model.currencyIndex],
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),

      // Language
      Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translate('language:'),
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).cursorColor,
              ),
            ),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (_) => chooseDialog(
                  context,
                  onSelect: (int i) => model.setLanguage(context, i),
                  options: languages,
                  title:
                      AppLocalizations.of(context).translate('choose_language'),
                ),
              ),
              child: Text(
                languages[model.languageIndex],
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      child: Consumer<SettingsViewModel>(
        builder: (_, model, child) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Feather.chevron_left,
                    color: Theme.of(context).cursorColor,
                  ),
                ),
              ),
              backgroundColor: Theme.of(context).backgroundColor,
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: _ui(context, model),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
