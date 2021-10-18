import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ss_manager/src/user/models/sales_model.dart';

class SaleProvider extends ChangeNotifier {
  CollectionReference _sales = FirebaseFirestore.instance.collection('sales');

  List<SaleModel> _salesTodayDB = [];
  double _totalToday = 0.0;
  SaleModel _newSale = SaleModel();

  set salesTodayDB(data) {
    _salesTodayDB = data;
    notifyListeners();
  }

  List<SaleModel> get salesTodayDB => _salesTodayDB;

  set totalToday(total) {
    _totalToday = total;
    notifyListeners();
  }

  double get totalToday => _totalToday;

  set dataNewSale(SaleModel sale) {
    _newSale = sale;
    notifyListeners();
  }

  Future newSale() {
    final today = DateTime.now();
    return _sales
        .add({
          'product': _newSale.product,
          'idProduct': _newSale.product,
          'total': _newSale.total,
          'pieces': _newSale.pieces,
          'user': _newSale.idUser,
          'date': today,
        })
        .then((value) => [1, 'Venta Agregada'])
        .catchError((onError) => [0, onError.toString()]);
  }

  Future getSalesToday(idUser) async {
    final today = DateTime.now();
    return _sales.where('user', isEqualTo: idUser).get().then((value) {
      Sales data = Sales.fromFirebase(value.docs);

      return [1, data];
    }).catchError((onError) => [0, onError.toString()]);
  }
}
