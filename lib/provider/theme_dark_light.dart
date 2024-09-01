import 'package:campus_connect/helper/hive_pref.dart';
import 'package:flutter/material.dart';

class ThemeDarkLight extends ChangeNotifier{
  bool themeDarkMode=Pref.currentThemeMode?true:false;
  void changeThemeMode(){
    Pref.currentThemeMode?themeDarkMode=true:themeDarkMode=false;
    notifyListeners();
  }
}