import 'package:flutter/material.dart';

Widget logoApp(BuildContext context, Widget child) {
  // Funcion que retorna el logo 
  return Column(
    children: [
      SafeArea(child: Container()),
      Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            children: [
              child,
              SizedBox(
                height: 20.0,
              ),
              RichText(
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
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 15.0,
                        )),
                    TextSpan(
                      text: 'Manager',
                      style: TextStyle(letterSpacing: 5.0, fontSize: 14.0),
                    )
                  ]))
            ],
          ))
    ],
  );
}
