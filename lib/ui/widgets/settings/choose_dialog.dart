import 'package:flutter/material.dart';

Widget chooseDialog(
  BuildContext context, {
  String title,
  List<String> options,
  Function(int i) onSelect,
}) {
  return GestureDetector(
    onTap: () => Navigator.pop(context),
    child: Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 150,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 10),
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        options.length,
                        (int i) => GestureDetector(
                          onTap: () {
                            onSelect(i);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            child: Center(
                              child: Text(
                                options[i],
                                style: TextStyle(
                                  color: Theme.of(context).cursorColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
