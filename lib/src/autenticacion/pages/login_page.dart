import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/forms/login_form.dart';
import 'package:ss_manager/src/autenticacion/providers/autenticacion_provider.dart';
import 'package:ss_manager/src/widgets/fields_widgets.dart';
import 'package:ss_manager/src/widgets/logo.dart';
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
            childWidget: logoApp(context, _welcomeText()),
            heightW: 250.0,
          ),
          BodyCustomWidget(
            childWidget: LoginForm(),
            heightW: heightScreen - 250,
            widthtW: widthScreen,
            paddingW: EdgeInsets.all(40.0),
          )
        ],
      )
    ]));
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
}
