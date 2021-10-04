import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/pages/register_page.dart';
import 'package:ss_manager/src/autenticacion/providers/autenticacion_provider.dart';
import 'package:ss_manager/src/autenticacion/providers/user_provider.dart';
import 'package:ss_manager/src/utils/preferences_user.dart';
import 'package:ss_manager/src/widgets/logo.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/utils_widgets.dart';
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
              functionAction: () async {
                await _loginGoogle(context);
              },
              text: 'Loguearse con Google',
              path: 'assets/images/google.png'),
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

  Future _loginGoogle(BuildContext context) async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final user = Provider.of<UserProvider>(context, listen: false);

    loaderView(context);
    final dataGoogle = await auth.getDataGoogle();
    Loader.hide();

    if (dataGoogle[0] == 1) {
      auth.setEmail = dataGoogle[1][0];
      auth.nameUser = dataGoogle[1][1];
      loaderView(context);
      final resp = await auth.loginForGoogle(dataGoogle[1][2]);
      Loader.hide();

      if (resp[0] == 1) {
        auth.idUser = resp[1];
        user.idUser = resp[1];
        Navigator.of(context).pushReplacementNamed('home');
      }
    }
  }

  _buttonRegister(BuildContext context) {
    return Row(
      children: [
        Text('No tienes Cuenta?'),
        TextButton(
            onPressed: () => Navigator.of(context).pushNamed('typeRegister'),
            child: Text(
              'Registrate',
              style: TextStyle(fontWeight: FontWeight.w600),
            ))
      ],
    );
  }
}

class TypeRegisterPage extends StatelessWidget {
  const TypeRegisterPage({Key? key}) : super(key: key);

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
            childWidget: _BodyOptionsRegister(),
            heightW: heightScreen,
            widthtW: widthScreen,
            paddingW: EdgeInsets.all(35.0),
          )
        ]));
  }
}

class _BodyOptionsRegister extends StatelessWidget {
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
            textW: 'Registro',
            childWidget: Text(''),
          ),
          SizedBox(
            height: 20.0,
          ),
          OptionRegister(
              functionAction: () async {
                await _googleRegister(context);
              },
              text: 'Registrarse con Google',
              path: 'assets/images/google.png'),
          SizedBox(
            height: 20.0,
          ),
          OptionRegister(
              functionAction: () => Navigator.of(context).pushNamed('register'),
              text: 'Registrarse con Correo ',
              path: 'assets/images/email.png')
        ],
      ),
    );
  }

  Future _googleRegister(BuildContext context) async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final user = Provider.of<UserProvider>(context, listen: false);
    PreferencesUser prefs = PreferencesUser();

    loaderView(context);
    final dataGoogle = await auth.getDataGoogle();
    Loader.hide();

    if (dataGoogle[0] == 1) {
      auth.setEmail = dataGoogle[1][0];
      auth.nameUser = dataGoogle[1][1];
      loaderView(context);
      final resp = await auth.registerGoogle(dataGoogle[1][2]);
      Loader.hide();
      if (resp[0] == 1) {
        auth.idUser = resp[1];
        final respSave = await auth.saveUser();
        if (respSave[0] == 1) {
          prefs.dataUser = resp[1];
          user.idUser = resp[1];
          Navigator.of(context).pushReplacementNamed('home');
        } else {
          messageError(respSave[1], 2);
        }
      } else {
        Loader.hide();
        messageError('No se pudo obtener informacion', 2);
      }
    }
  }
}
