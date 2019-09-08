import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_manager/themes.dart';

Widget namedAppBar(String title, BuildContext context) {
  var _themeProvider = Provider.of<ThemeProvider>(context);

  return AppBar(
    centerTitle: true,
    title: Text(title, style: TextStyle(color: Colors.white)),
    actions: <Widget>[
      Switch(
        value: _themeProvider.value,
        onChanged: (_) => {
          _themeProvider.toggleValue(),
        },
      ),
    ],
  );
}
