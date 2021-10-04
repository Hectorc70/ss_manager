import 'package:flutter/material.dart';

import 'package:ss_manager/src/autenticacion/pages/login_page.dart';
import 'package:ss_manager/src/autenticacion/pages/page_auth.dart';
import 'package:ss_manager/src/autenticacion/pages/register_page.dart';
import 'package:ss_manager/src/user/pages/business_page.dart';
import 'package:ss_manager/src/user/pages/home_page.dart';
import 'package:ss_manager/src/user/pages/inventory_page.dart';
import 'package:ss_manager/src/user/pages/sale_page.dart';
import 'package:ss_manager/src/utils/preferences_user.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  Map _initRoute = {};
  final prefs = PreferencesUser();

  if (prefs.dataUser == '') {
    _initRoute['init'] = (BuildContext context) => TypeAuthPage();
  } else {
    _initRoute['init'] = (BuildContext context) => HomePage();
  }

  return <String, WidgetBuilder>{
    '/': _initRoute['init'],
    'login': (BuildContext context) => LoginPage(),
    'typeLogin': (BuildContext context) => TypeAuthPage(),
    'typeRegister': (BuildContext context) => TypeRegisterPage(),
    'register': (BuildContext context) => RegisterPage(),
    'home': (BuildContext context) => HomePage(),
    'inventory': (BuildContext context) => InventoryPage(),
    'sales': (BuildContext context) => SalePage(),
    'business': (BuildContext context) => BusinessPage(),
  };
}
