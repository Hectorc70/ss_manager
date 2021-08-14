import 'package:flutter/material.dart';

import 'package:ss_manager/src/autenticacion/pages/login_page.dart';
import 'package:ss_manager/src/autenticacion/pages/register_page.dart';
import 'package:ss_manager/src/user/pages/business_page.dart';
import 'package:ss_manager/src/user/pages/home_page.dart';
import 'package:ss_manager/src/user/pages/sale_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'register': (BuildContext context) => RegisterPage(),
    'home': (BuildContext context) => HomePage(),
    'newSale': (BuildContext context) => NewSalePage(),
    'business': (BuildContext context) => BusinessPage(),
  };
}
