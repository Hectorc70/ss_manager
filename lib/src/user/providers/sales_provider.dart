import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ss_manager/src/user/models/sales_model.dart';

class SaleProvider extends ChangeNotifier {
   CollectionReference _sales =
      FirebaseFirestore.instance.collection('sales');

  SaleModel _newSale = SaleModel();

  set dataNewSale(SaleModel sale) {
    _newSale = sale;
    notifyListeners();
  }


  Future newProduct() {
    return _sales
        .add({
          'product': _newSale.product,
          'total': _newSale.total,
          'pieces': _newSale.pieces,
          'user':  _newSale.idUser,
        })
        .then((value) => [1, 'Venta Agregada'])
        .catchError((onError) => [0, onError.toString()]);
  }
}
