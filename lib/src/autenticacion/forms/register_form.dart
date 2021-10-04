import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/providers/autenticacion_provider.dart';
import 'package:ss_manager/src/autenticacion/providers/user_provider.dart';
import 'package:ss_manager/src/utils/preferences_user.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/fields_widgets.dart';
import 'package:ss_manager/src/widgets/utils_widgets.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final controllerPass = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerName = TextEditingController();

  @override
  void dispose() {
    controllerPass.dispose();
    controllerEmail.dispose();
    controllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
            padding: EdgeInsetsDirectional.only(start: 25.0, end: 25.0),
            children: [
              FieldInputCustom(
                  controllerField: controllerEmail,
                  hintTextC: 'correo@gmail.com',
                  labelTextInput: 'Tu correo'),
              SizedBox(
                height: 15.0,
              ),
              FieldInputCustom(
                controllerField: controllerName,
                hintTextC: 'Tu nombre',
                labelTextInput: 'Nombre Completo',
              ),
              SizedBox(
                height: 15.0,
              ),
              FieldInputCustom(
                controllerField: controllerPass,
                hintTextC: '******',
                labelTextInput: 'Contraseña',
                textNotVisible: true,
              ),
              SizedBox(
                height: 20.0,
              ),
              ButtonCustomSubmit(
                  textName: 'Aceptar', functionAction: _validateForm),
            ]));
  }

  _validateForm(BuildContext context) async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final user = Provider.of<UserProvider>(context, listen: false);
    PreferencesUser prefs = PreferencesUser();

    if (_formKey.currentState!.validate()) {
      auth.nameUser = controllerName.text;
      auth.setPassword = controllerPass.text;
      auth.setEmail = controllerEmail.text;

      loaderView(context);

      final registerResp = await auth.registerUserForEmailFirebase();
      Loader.hide();
      if (registerResp[0] == 1) {
        auth.idUser = registerResp[1];
        loaderView(context);
        final resp = await auth.saveUser();
        Loader.hide();
        if (resp[0] == 1) {
          prefs.dataUser = registerResp[1];
          user.idUser = registerResp[1];
          Navigator.of(context).pushReplacementNamed('home');
        } else {
          messageError(resp[1], 2);
        }
      } else {
        messageError(registerResp[1], 2);
      }
    }
  }
}
