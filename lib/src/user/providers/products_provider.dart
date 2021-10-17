import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ss_manager/src/user/models/product_model.dart';
import 'package:ss_manager/src/utils/preferences_user.dart';

class ProductsProvider extends ChangeNotifier {
  CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  ProductModel _dataNewProd = ProductModel();
  List<ProductModel> _productsDB = [];
  Map<String, ProductModel> _productsDBMap = {};
  List<Map<String, String>> _productsSelect = [];

  set productsSelect(prods) {
    _productsSelect = prods;
    notifyListeners();
  }

  set productsDB(List<ProductModel> prods) {
    _productsDB = prods;
    notifyListeners();
  }

  set productsDBMap(Map<String, ProductModel> prods) {
    _productsDBMap = prods;
    notifyListeners();
  }

  set dataNewProduct(ProductModel product) {
    _dataNewProd = product;
    notifyListeners();
  }

  List<ProductModel> get productsDB => _productsDB;
  Map<String, ProductModel> get productsDBMap => _productsDBMap;
  List<Map<String, String>> get productsSelect => _productsSelect;

  Future newProduct() {
    return _products
        .add({
          'name': _dataNewProd.name,
          'price': _dataNewProd.price,
          'pieces': _dataNewProd.pieces,
          'user': _dataNewProd.idUser,
        })
        .then((value) => [0, 'Producto Agregado'])
        .catchError((onError) => [1, onError.toString()]);
  }

  Future getProducts(idUser) async {
    return _products.where('user', isEqualTo: idUser).get().then((value) {
      Products data = Products.fromFirebase(value.docs);

      return [1, data];
    }).catchError((onError) => [0, onError.toString()]);
  }
}
