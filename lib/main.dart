import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/providers/autenticacion_provider.dart';
import 'package:ss_manager/src/routes/routes.dart';
import 'package:ss_manager/src/user/providers/orders_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
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
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(9, 64, 74, 1),
          colorScheme: ColorScheme(
            primary: Color.fromRGBO(9, 64, 74, 1),
            primaryVariant: Colors.white,
            secondary: Color.fromRGBO(0, 135, 159, 1),
            secondaryVariant: Color.fromARGB(100, 0, 135, 159),
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
          fontFamily: 'Poppins',
        ),
        routes: getApplicationRoutes(),
      ),
    );
  }
}
