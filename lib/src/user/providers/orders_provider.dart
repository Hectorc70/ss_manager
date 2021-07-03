import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {
  createNewOrder() {
    final databaseReference = FirebaseDatabase.instance.reference();

    databaseReference
        .child("1")
        .set({'Name': 'Producto1', 'Amount': '2', 'Import': '5.00'});
  }
}
