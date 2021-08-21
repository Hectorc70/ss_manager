import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/providers/autenticacion_provider.dart';
import 'package:ss_manager/src/autenticacion/providers/user_provider.dart';
import 'package:ss_manager/src/routes/routes.dart';
import 'package:ss_manager/src/user/providers/nav_ui.dart';
import 'package:ss_manager/src/user/providers/products_provider.dart';
import 'package:ss_manager/src/user/providers/sales_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ss_manager/src/utils/preferences_user.dart';

void main() async {
  final prefs = new PreferencesUser();
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.initiPrefs();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SaleProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(236, 162, 171, 1),
          colorScheme: ColorScheme(
            primary: Color.fromRGBO(236, 162, 171, 1),
            primaryVariant: Colors.white,
            secondary: Colors.white,
            secondaryVariant: Color.fromRGBO(74, 9, 6, 1),
            surface: Color.fromRGBO(57, 62, 70, 1),
            background: Color.fromRGBO(57, 62, 70, 1),
            error: Colors.red.shade300,
            onPrimary: Color.fromRGBO(57, 62, 70, 1),
            onSecondary: Color.fromRGBO(57, 62, 70, 1),
            onSurface: Color.fromRGBO(57, 62, 70, 1),
            onBackground: Color.fromRGBO(57, 62, 70, 1),
            onError: Colors.red.shade300,
            brightness: Brightness.light,
          ),
          textTheme: TextTheme(
              bodyText1: TextStyle(
                  color: Color.fromRGBO(236, 162, 171, 1),
                  fontFamily: 'PoppinsBold',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
              bodyText2: TextStyle(
                  color: Colors.grey.shade400,
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400),
              headline6: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500),
              headline5: TextStyle(
                  color: Color.fromRGBO(97, 95, 95, 1),
                  fontFamily: 'PoppinsBold',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500)),
          fontFamily: 'Poppins',
        ),
        routes: getApplicationRoutes(),
      ),
    );
  }
}
