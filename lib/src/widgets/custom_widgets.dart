import 'package:flutter/material.dart';

class AppBarHomeCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget welcome = Text(
      'Hola Bienvenido!',
      style: TextStyle(
        fontFamily: "Poppins",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w800,
        fontSize: 22.0,
        color: Colors.white,
      ),
    );

    final colorPrincipal = Theme.of(context).primaryColor;
    return Container(
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 70.0, 5.0),
        decoration: BoxDecoration(
          color: colorPrincipal,
        ),
      ),
    );
  }
}

