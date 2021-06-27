//import 'package:ECommerceApp/models/dark_theme_preferences.dart';
import 'package:flutter/material.dart';
import 'package:thrift_books/models/dark_theme_preferences.dart';

class DarkThemeProvider with ChangeNotifier{
 DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  bool _darkTheme = false ;
  bool get darkTheme=>_darkTheme;

  set darkTheme (bool value){
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}