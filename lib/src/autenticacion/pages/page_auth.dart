import 'package:flutter/material.dart';
import 'package:ss_manager/src/autenticacion/pages/register_page.dart';
import 'package:ss_manager/src/widgets/logo.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/widgets_body.dart';

class TypeAuthPage extends StatelessWidget {
  const TypeAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final colorP = Theme.of(context).primaryColor;
    final colorSecond = Theme.of(context).colorScheme.secondary;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 140.0,
          flexibleSpace: Container(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: logoApp(context, Text(''))),
          leading: IconButton(
            alignment: AlignmentDirectional.topStart,
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: colorSecond,
              size: 30.0,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Stack(children: [
          Container(
            color: colorP,
            height: heightScreen,
          ),
          BodyCustomWidget(
            childWidget: _BodyOptions(),
            heightW: heightScreen,
            widthtW: widthScreen,
            paddingW: EdgeInsets.all(35.0),
          )
        ]));
  }
}

class _BodyOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).colorScheme.secondaryVariant;
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Container(
      alignment: AlignmentDirectional.center,
      width: double.infinity,
      child: Column(
        children: [
          NameSection(
            textW: 'Login',
            childWidget: Text(''),
          ),
          SizedBox(
            height: 20.0,
          ),
          OptionRegister(
              text: 'Loguearse con Google', path: 'assets/images/google.png'),
          SizedBox(
            height: 20.0,
          ),
          OptionRegister(
              functionAction: () => Navigator.of(context).pushNamed('login'),
              text: 'Loguearse con Correo ',
              path: 'assets/images/email.png'),
          SizedBox(
            height: 20.0,
          ),
          _buttonRegister(context)
        ],
      ),
    );
  }

  _buttonRegister(BuildContext context) {
    return Row(
      children: [
        Text('No tienes Cuenta?'),
        TextButton(
            onPressed: () => Navigator.of(context).pushNamed('register'),
            child: Text(
              'Registrate',
              style: TextStyle(fontWeight: FontWeight.w600),
            ))
      ],
    );
  }
}
