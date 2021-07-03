import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {
  final databaseReference = FirebaseDatabase.instance.reference();
  createNewOrder() {
    

    databaseReference
        .child("1")
        .set({'Name': 'Producto1', 'Amount': '2', 'Import': '5.00'});
  }

  getLastOrders()  {


    final data = databaseReference.once().then((DataSnapshot snapshot) {
      print('data: ${snapshot.value}');
    });
    print(data);
  }
}
