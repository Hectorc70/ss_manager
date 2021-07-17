import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/forms/login_form.dart';
import 'package:ss_manager/src/autenticacion/providers/autenticacion_provider.dart';
import 'package:ss_manager/src/widgets/fields_widgets.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Material(
        child: Stack(children: [
      _background(context),
      Column(
        children: [
          HeaderCustomWidget(
            childWidget: _logo(context),
            heightW: 200.0,
          ),
          BodyCustomWidget(
            childWidget: LoginForm(),
            heightW: heightScreen - 200,
          )
        ],
      )
    ]));
  }

  Widget _header(BuildContext context) {
    final colorPrimary = Theme.of(context).primaryColor;
    final heigth = MediaQuery.of(context).size.height;
    return Container(
        width: double.infinity,
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

    return ListView(children: []);
  }

  Widget _background(BuildContext context) {
    final colorP = Theme.of(context).colorScheme.primary;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: colorP),
    );
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
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
            color: Colors.white),
      ),
    );
  }

  Widget _logo(BuildContext context) {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: 130.0,
        child: Column(
          children: [
            _welcomeText(),
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
        ));
  }
}
