/* src/validation/validation_item.dart */

import 'package:flutter/material.dart';
import './validation_item.dart';

class SignupValidation with ChangeNotifier {
  ValidationItem _name = ValidationItem(null, null);
  ValidationItem _lastName = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  ValidationItem get name => _name;
  ValidationItem get lastName => _lastName;
  ValidationItem get email => _email;
  ValidationItem get password => _password;

  void changeName(final value) {
    if (value != null) {
      _name = ValidationItem(value, null);
    } else {
      _name = ValidationItem(value, 'Se requiere que escriba un nombre');
    }

    notifyListeners();
  }
}
