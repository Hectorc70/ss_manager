import 'package:flutter/material.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/fields_widgets.dart';

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
          ButtonCustomSubmit(textName: 'Login', functionAction: _validateForm),
          _buttonRegister(context)
        ]));
  }

  _buttonRegister(BuildContext context) {
    return Row(
      children: [
        Text('No tienes Cuenta?'),
        TextButton(
            onPressed: () {},
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

  _validateForm(BuildContext) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, 'home');
    }
  }
}
