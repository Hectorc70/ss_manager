import 'package:flutter/material.dart';
import 'package:ss_manager/src/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Color.fromRGBO(41, 161, 156, 1)),
      routes: getApplicationRoutes(),
    );
  }
}
