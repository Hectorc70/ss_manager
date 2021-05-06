import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/routes/routes.dart';
import 'package:ss_manager/src/validations/autenticacion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignupValidation(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(41, 161, 156, 1),
          accentColor: Colors.white,
          
          colorScheme: ColorScheme(
            primary: Color.fromRGBO(41, 161, 156, 1),
            primaryVariant: Color.fromRGBO(41, 161, 156, 1), 
            secondary: Color.fromRGBO(57, 62, 70, 1), 
            secondaryVariant: Color.fromRGBO(57, 62, 70, 1), 
            surface: Color.fromRGBO(57, 62, 70, 1),
            background: Color.fromRGBO(57, 62, 70, 1), 
            error: Color.fromRGBO(57, 62, 70, 1), 
            onPrimary: Color.fromRGBO(57, 62, 70, 1), 
            onSecondary: Color.fromRGBO(57, 62, 70, 1), 
            onSurface: Color.fromRGBO(57, 62, 70, 1), 
            onBackground: Color.fromRGBO(57, 62, 70, 1), 
            onError: Color.fromRGBO(57, 62, 70, 1), 
            brightness: Brightness.light,
            ),
          fontFamily: 'Poppins',
        ),
        routes: getApplicationRoutes(),
      ),
    );
  }
}
