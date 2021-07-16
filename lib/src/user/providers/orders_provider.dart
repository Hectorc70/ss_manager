import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {
  final databaseReference = FirebaseDatabase.instance.reference();
  createNewSale() {
    final dateTime = new DateTime.now().toString().split('.')[0];
    final part1 = dateTime.replaceAll(' ', '');
    final part2 = part1.replaceAll('-', '');
    final id= part2.replaceAll(':', '');
    databaseReference
        .child("1")
        .set({'Name': 'Producto1', 'Amount': '2', 'Import': '5.00'});
  }

  getLastSales() {
    final data = databaseReference.once().then((DataSnapshot snapshot) {
      print('data: ${snapshot.value}');
    });
    print(data);
  }
}
