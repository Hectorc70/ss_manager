import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ss_manager/src/utils/preferences_user.dart';

class ProductsProvider extends ChangeNotifier {
  CollectionReference _products =
      FirebaseFirestore.instance.collection('products');
  String _name = '';
  String _mount = '';
  String _pieces = '';

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  set mount(String mount) {
    _mount = mount;
    notifyListeners();
  }

  set pieces(String piecesMount) {
    _pieces = piecesMount;
    notifyListeners();
  }

  newProduct() {
    final prefs = PreferencesUser();
    final id_user = prefs.dataUser[2];

    return _products
        .add({'name': _name, 'price': _mount, 'pieces': _pieces, 'user':id_user})
        .then((value) => [0, 'Producto Agregado'])
        .catchError((onError) => [1, onError.toString()]);
  }
}
