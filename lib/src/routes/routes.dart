import 'package:flutter/material.dart';

import 'package:ss_manager/src/pages/autenticacion/login_page.dart';
import 'package:ss_manager/src/pages/autenticacion/register_page.dart';
import 'package:ss_manager/src/pages/autenticacion/welcome_page.dart';
import 'package:ss_manager/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/' :(BuildContext context) => WelcomePage(),
    'login' :(BuildContext context) => LoginPage(),
    'register' :(BuildContext context) => RegisterPage(),
    'home' :(BuildContext context) => HomePage(),
  }; 
}
