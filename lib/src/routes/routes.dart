import 'package:flutter/material.dart';

import 'package:ss_manager/src/autenticacion/pages/login_page.dart';
import 'package:ss_manager/src/autenticacion/pages/page_auth.dart';
import 'package:ss_manager/src/autenticacion/pages/register_page.dart';
import 'package:ss_manager/src/user/pages/business_page.dart';
import 'package:ss_manager/src/user/pages/home_page.dart';
import 'package:ss_manager/src/user/pages/inventory_page.dart';
import 'package:ss_manager/src/user/pages/sale_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => TypeAuthPage(),
    'login': (BuildContext context) => LoginPage(),
    'typeRegister': (BuildContext context) => TypeRegisterPage(),
    'register': (BuildContext context) => RegisterPage(),
    'home': (BuildContext context) => HomePage(),
    'inventory': (BuildContext context) => InventoryPage(),
    'sales': (BuildContext context) => SalePage(),

    'business': (BuildContext context) => BusinessPage(),
  };
}
