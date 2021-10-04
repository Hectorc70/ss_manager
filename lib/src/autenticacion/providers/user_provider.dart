import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ss_manager/src/user/models/user_model.dart';

class UserProvider with ChangeNotifier {
  CollectionReference _users = FirebaseFirestore.instance.collection('users');
  UserModel _user = UserModel();

  set userData(UserModel data) {
    this._user = data;
    notifyListeners();
  }

  UserModel get userData => this._user;

  Future getDataUser(idUser) async {
    UserModel userData =  UserModel();
    return _users.where('id', isEqualTo: idUser).get().then((value) {
      for (final user in value.docs) {
        final  productData = user.data();
        userData = UserModel.fromJson(productData as Map<String, dynamic>);
      }

      return [1, userData];
    }).catchError((onError) => [0, onError.toString()]);
  }
}
