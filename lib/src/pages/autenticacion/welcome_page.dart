import 'dart:ui';

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Material(
          child: Stack(children: [
            _background(context),
            Column(
              children: [
                _welcomeText(),
                SizedBox(
                  height: 150.0,
                ),
                _logo(context),
                SizedBox(
                  height: 20.0,
                ),
                _options(
                  context,
                ),
              ],
            ),
          ]),
        ));
  }

  Widget _welcomeText() {
    return Container(
      width: double.infinity,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 40.0),
      child: Text(
        'Hola Bienvenido',
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
            color: Colors.white),
      ),
    );
  }

  Widget _logo(BuildContext context) {
    return Container(
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        height: 130.0,
        child: RichText(
            text: TextSpan(
                style: TextStyle(
                    fontFamily: 'Post',
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    height: 0.6,
                    color: Colors.white),
                children: <TextSpan>[
              TextSpan(
                  text: "SS\n",
                  style: TextStyle(
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 10.0,
                  )),
              TextSpan(
                text: 'Manager',
                style: TextStyle(
                  letterSpacing: 5.0,
                ),
              )
            ])));
  }

  Widget _options(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
      child: Column(children: [
        Material(
          color: Colors.white,
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          shadowColor: Color.fromARGB(250, 1, 24, 76),
          child: MaterialButton(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
            child: Text(
              "Iniciar Sesión",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(57, 62, 70, 1)),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Material(
          color: Color.fromRGBO(57, 62, 70, 1),
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          shadowColor: Color.fromARGB(250, 1, 24, 76),
          child: MaterialButton(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              Navigator.pushNamed(context, 'register');
            },
            child: Text(
              "Registro",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _background(BuildContext context) {
    final colorPrimary = Theme.of(context).primaryColor;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: colorPrimary),
    );
  }
}
