import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/providers/autenticacion_provider.dart';
import 'package:ss_manager/src/autenticacion/providers/user_provider.dart';
import 'package:ss_manager/src/utils/preferences_user.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/fields_widgets.dart';
import 'package:ss_manager/src/widgets/utils_widgets.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controllerPass = TextEditingController();
  final controllerEmail = TextEditingController();

  LoginFormState() {
    final user = PreferencesUser();
    if (user.dataUser.length != 0) {
      controllerEmail.text = user.dataUser[0];
      controllerPass.text = user.dataUser[1];
    }
  }
  @override
  void dispose() {
    controllerPass.dispose();
    controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Form(
        key: _formKey,
        child: Column(children: [
          Text(
            'Iniciar Sesión',
            style: TextStyle(
                color: Color.fromRGBO(46, 46, 46, 1),
                fontWeight: FontWeight.w600,
                fontSize: 22.0),
          ),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ListView(
                    children: [
                      FieldInputCustom(
                          controllerField: controllerEmail,
                          hintTextC: 'correo@gmail.com',
                          labelTextInput: 'Correo Electronico'),
                      SizedBox(
                        height: 25.0,
                      ),
                      FieldInputCustom(
                        controllerField: controllerPass,
                        hintTextC: '******',
                        labelTextInput: 'Contraseña',
                        textNotVisible: true,
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      _buttonChangePassword(context),
                      SizedBox(
                        height: 30.0,
                      ),
                      ButtonCustomSubmit(
                          textName: 'Login', functionAction: _validateForm),
                      _buttonRegister(context)
                    ],
                  )))
        ]));
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

  _buttonChangePassword(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Text('Recuperar Contraseña'),
      TextButton(
          onPressed: () {},
          child: Text('Aqui', style: TextStyle(fontWeight: FontWeight.w600)))
    ]);
  }

  _validateForm(BuildContext context) async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final user = Provider.of<UserProvider>(context, listen: false);
    final color = Theme.of(context).colorScheme.secondaryVariant;
    if (_formKey.currentState!.validate()) {
      loaderView(context);
      auth.setEmail = controllerEmail.text;
      auth.setPassword = controllerPass.text;
      final respLogin = await auth.loginUser();

      Loader.hide();
      if (respLogin[0] == 0) {
        messageError(respLogin[1], 1);
      } else {
        user.idUser = respLogin[1];
        final prefs = PreferencesUser();
        prefs.dataUser = [
          controllerEmail.text,
          controllerPass.text,
          respLogin[1]
        ];
        Navigator.pushReplacementNamed(context, 'home');
      }
    }
  }
}
