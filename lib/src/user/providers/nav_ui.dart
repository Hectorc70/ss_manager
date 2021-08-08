import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _select = 0;

  set selectOption(int i) {
    this._select = i;
    notifyListeners();
  } 
  int get selectOption => this._select;


  
}
