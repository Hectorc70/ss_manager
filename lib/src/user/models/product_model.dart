import 'package:flutter/foundation.dart';

class Products {
  List<ProductModel> items = [];
  List<Map<String, String>> itemsSelect = [];
  Map<String, ProductModel> products = {};

  Products();

  Products.fromFirebase(List<dynamic> jsonList) {
    if (jsonList == null || jsonList == 0) return;

    for (final item in jsonList) {
      final mun =
          ProductModel.fromJson(item.data() as Map<String, dynamic>, item.id);
      Map<String, String> data = {
        'value': mun.idDocument,
        'label': mun.name,
      };
      products[mun.idDocument] = mun;
      itemsSelect.add(data);
      items.add(mun);
    }
  }
}

class ProductModel {
  final idDocument;
  final name;
  final pieces;
  final price;
  final idUser;
  ProductModel({
    this.idDocument,
    this.name,
    this.pieces,
    this.price,
    this.idUser,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data, id) => ProductModel(
        idDocument: id,
        name: data['name'],
        pieces: data['pieces'],
        price: data['price'],
        idUser: data['user'],
      );
}
