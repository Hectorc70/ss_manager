import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/forms/login_form.dart';
import 'package:ss_manager/src/autenticacion/providers/autenticacion_provider.dart';
import 'package:ss_manager/src/widgets/fields_widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(children: [
      _background(context),
      _header(context),
      _formLogin(context),
    ]));
  }

  Widget _header(BuildContext context) {
    final colorPrimary = Theme.of(context).primaryColor;
    final heigth = MediaQuery.of(context).size.height;
    return Container(
        color: colorPrimary,
        width: double.infinity,
        height: heigth / 2.0,
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                  color: Colors.white,
                  iconSize: 30.0,
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            _logo(context),
          ],
        ));
  }

  Widget _formLogin(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colorSecond2 = Theme.of(context).colorScheme.secondaryVariant;
    final colorPrimary = Theme.of(context).primaryColor;

    final login = Provider.of<UserProvider>(context);

    return SingleChildScrollView(
        child: Column(children: [
      SafeArea(child: Container(height: 250.0)),
      Container(
          width: width * .95,
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: colorSecond2,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 5.0,
                  offset: Offset(0.0, 3.0),
                  spreadRadius: 2.0,
                )
              ]),
          child: LoginForm())
    ]));
  }

  Widget _background(BuildContext context) {
    final colorSecond = Theme.of(context).colorScheme.secondary;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: colorSecond),
    );
  }

  Widget _logo(BuildContext context) {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
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
}
