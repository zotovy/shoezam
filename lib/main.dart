import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shoezam/core/models/settings_model.dart';
import 'package:shoezam/core/services/images.dart';
import 'package:shoezam/core/utils/themes.dart';
import 'package:shoezam/core/viewmodels/settings_model.dart';
import 'package:shoezam/localization.dart';
import 'package:shoezam/locator.dart';
import 'package:shoezam/router.dart';
import 'package:shoezam/ui/views/home.dart';

void main() async {
  setupLocator();
  await locator<ImageServices>().initilializeCameras();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsModel()),
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Future setupApp(context) async {
    await locator<SettingsViewModel>().setup(context);
  }

  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<SettingsModel>(context);

    return MaterialApp(
      supportedLocales: [
        Locale('en', 'EN'),
        Locale('ru', 'RU'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Locale('en', 'EN'), // todo: dynamic language
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        print('Not supported location $locale. Choose EN');
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: settings.isDark
          ? ThemeMode.dark
          : ThemeMode.light, // todo: dynamic theme
      home: FutureBuilder(
          future: setupApp(context),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return HomePage();
            } else {
              return Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                body: Center(child: CircularProgressIndicator()),
              );
            }
          }),
      onGenerateRoute: (settings) => Router.generateRoute(settings, context),
    );
  }
}
