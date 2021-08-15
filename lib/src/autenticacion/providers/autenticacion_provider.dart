import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider with ChangeNotifier {
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
      email: this._email,
      password: this._password,
    );


    return user;
  }

  Future<UserCredential> registerGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<List<dynamic>> loginUser() async {
    try {
      final resp = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: this._email, password: this._password);

      String? idUser = resp.user?.uid;

      return [1, idUser ?? ''];
    } on FirebaseAuthException catch (e) {
      String errorDesc = _errorConvert(e.code);

      return [0, errorDesc];
    }
  }

  _errorConvert(String error) {
    if (error == 'wrong-password') {
      return 'Contraseña incorrecta';
    } else if (error == 'user-not-found') {
      return 'No existe usuario con el correo proporcionado';
    } else {
      return error;
    }
  }
}
