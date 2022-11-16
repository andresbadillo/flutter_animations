import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: // Ligth
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;

      case 2: // Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;

      case 3: // Dark
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      );
    } else {
      _currentTheme = ThemeData.light();
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.black26,
        ),
      );
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: const Color(0xff48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: const Color(0xff16202B),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff16202B),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xff16202B),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff48A0EB),
        ),
      );
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      );
    } else {
      _currentTheme = ThemeData.light();
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.black26,
        ),
      );
    }

    notifyListeners();
  }
}
