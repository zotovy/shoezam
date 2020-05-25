import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:shoezam/core/viewmodels/home_model.dart';
import 'package:shoezam/localization.dart';
import 'package:shoezam/locator.dart';
import 'package:shoezam/ui/widgets/home/camera_preview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Model
  HomeViewModel _model = locator<HomeViewModel>();

  List<Widget> _ui(context, HomeViewModel model) {
    return [
      CamaraLivePreviewWidget(),
      buildRecognizeButton(context),
      buildFrameBox(context),
      menuButton(context),
    ];
  }

  void toggleMenu() => Navigator.pushNamed(context, 'menu', arguments: '/');

  Widget buildFrameBox(BuildContext context) => Positioned(
        top: 0,
        bottom: 0,
        right: 0,
        left: 0,
        child: Center(
          child: Container(
            width: 300, // todo: change with adaptive value
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 3, color: Colors.white),
            ),
          ),
        ),
      );

  Widget menuButton(BuildContext context) => Positioned(
        top: 25,
        left: 0,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
            ),
            color: Theme.of(context).accentColor,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
              onTap: toggleMenu,
              child: Icon(
                Icons.menu,
                size: 28,
                color: Theme.of(context).cursorColor,
              ),
            ),
          ),
        ),
      );

  Widget buildRecognizeButton(BuildContext context) => Positioned(
        bottom: 16,
        left: 50,
        right: 50,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          width: double.infinity,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: Icon(
                        Feather.camera,
                        color: Theme.of(context).cursorColor,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      AppLocalizations.of(context).translate('recognize'),
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).cursorColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      child: Consumer<HomeViewModel>(
        builder: (_, model, child) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              body: Stack(
                children: _ui(context, model),
              ),
            ),
          );
        },
      ),
    );
  }
}
