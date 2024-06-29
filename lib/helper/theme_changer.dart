// theme_model.dart
import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  ThemeData _themeData;

  ThemeModel(this._themeData);

  get themeData => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
