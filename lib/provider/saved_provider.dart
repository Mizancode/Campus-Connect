import 'package:flutter/material.dart';

class SavedProvider extends ChangeNotifier{
  List<Map<String,dynamic>> list=[];

  void add(Map<String,dynamic> map){
     list.add(map);
     notifyListeners();
  }

  void remove(Map<String,dynamic> map){
    list.remove(map);
    notifyListeners();
  }
}