import 'package:flutter/material.dart';

import 'package:ss_manager/src/pages/login_page.dart';
import 'package:ss_manager/src/pages/welcome_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/' :(BuildContext context) => WelcomePage(),
    'login' :(BuildContext context) => LoginPage(),
  }; 
}
