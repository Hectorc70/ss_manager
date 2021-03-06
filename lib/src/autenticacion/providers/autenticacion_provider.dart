import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ss_manager/src/utils/preferences_user.dart';
import 'package:ss_manager/src/widgets/utils_widgets.dart';

class AuthProvider with ChangeNotifier {
  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  String _email = '';
  String _password = '';
  String _idUser = '';
  String _name = '';

  set nameUser(name) {
    _name = name;
    notifyListeners();
  }

  set idUser(id) {
    _idUser = id;
    notifyListeners();
  }

  set setEmail(String email) {
    this._email = email;
    notifyListeners();
  }

  set setPassword(String password) {
    this._password = password;
    notifyListeners();
  }

  Future<dynamic> loginUserForEmail() async {
    try {
      final resp = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      String? idUser = resp.user?.uid;
      return [1, idUser ?? ''];
    } on FirebaseAuthException catch (e) {
      String errorDesc = _errorConvert(e.code);

      return [0, errorDesc];
    }
  }

  Future<dynamic> registerUserForEmailFirebase() async {
    final login = await loginUserForEmail();
    if (login[0] == 1) {
      return [0, 'Email ya en uso, Favor de Loguearse'];
    } else {
      final resp = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      String? idUser = resp.user?.uid;

      return [1, idUser];
    }
  }

  Future<dynamic> getDataGoogle() async {
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      List dataUser = [googleUser.email, googleUser.displayName, credential];
      return [1, dataUser];
    } catch (e) {
      return [0, e.toString()];
    }
  }

  Future<dynamic> registerGoogle(credential) async {
    try {
      final resp = await FirebaseAuth.instance.signInWithCredential(credential);

      String? idUser = resp.user?.uid;
      return [1, idUser];
    } catch (e) {
      return [0, ''];
    }
  }

  Future<dynamic> loginForGoogle(credential) async {
    final prefs = PreferencesUser();
    try {
      final resp = await FirebaseAuth.instance.signInWithCredential(credential);

      String? idUser = resp.user?.uid;

      final user = await _getUser(idUser);

      if (user[0] == 0 && user[1].docs.length == 0) {
        _idUser = idUser.toString();
        final respSave = await saveUser();
        if (respSave[0] == 1) {
          messageOk('usuario Creado', 2);
          return [1, idUser];
        }
      } else {
        return [1, idUser];
      }
    } catch (e) {
      return [0, ''];
    }
  }

  Future _getUser(idUser) {
    return _users.where('id', isEqualTo: idUser).get().then((value) {
      return [0, value];
    }).catchError((onError) => [1, onError.toString()]);
  }

  Future saveUser() {
    return _users
        .add({'id': _idUser, 'full_name': _name, 'email': _email})
        .then((value) => [1, 'Registro Completo'])
        .catchError((onError) => [0, onError.toString()]);
  }

  _errorConvert(String error) {
    if (error == 'wrong-password') {
      return 'Contrase??a incorrecta';
    } else if (error == 'user-not-found') {
      return 'No existe usuario con el correo proporcionado';
    } else {
      return error;
    }
  }
}
