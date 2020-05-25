import 'package:flutter/material.dart';
import 'package:shoezam/localization.dart';

class MenuPage extends StatelessWidget {
  final String lastPagePath;

  MenuPage({
    this.lastPagePath,
  });

  final List<String> localizationKey = [
    "recognize_shoe",
    "news",
    "favourites",
    "settings",
  ];

  final List<String> navigationPath = ["/", "news", "favourites", "settings"];

  Widget buildMenuTile(BuildContext context, int i) => GestureDetector(
        onTap: () => lastPagePath == navigationPath[i]
            ? Navigator.pop(context)
            : Navigator.pushNamed(context, navigationPath[i]),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            AppLocalizations.of(context).translate(localizationKey[i]),
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // Close button
            Positioned(
              top: 16,
              left: 16,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).cursorColor,
                  size: 28,
                ),
              ),
            ),

            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    4,
                    (int i) => buildMenuTile(context, i),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
