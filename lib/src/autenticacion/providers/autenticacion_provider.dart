import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class UserProvider with ChangeNotifier {
  String _email = '';
  String _password = '';

  set setEmail(String email) {
    this._email = email;
    notifyListeners();
  }

  set setPassword(String password) {
    this._password = password;
    notifyListeners();
  }

  Future<dynamic> registerUser() async {
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: "hecgarcia.n@gmail.com",
      password: "es3sa222",
    );

    return user;
  }

  Future<dynamic> loginUser() async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'hecgarcia.n@gmail.com', password: 'es3sa222');

      return '';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
}
