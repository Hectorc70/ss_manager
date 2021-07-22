import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _idUser = '';

  set idUser(String id) {
    this._idUser = id;
    notifyListeners();
  }

  String get idUser => this._idUser;
}
