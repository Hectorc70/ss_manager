import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/forms/login_form.dart';
import 'package:ss_manager/src/autenticacion/providers/autenticacion_provider.dart';
import 'package:ss_manager/src/widgets/logo.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';

class RegisterPage extends StatelessWidget {
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
            childWidget: logoApp(context, Text('')),
            heightW: 150.0,
          ),
          BodyCustomWidget(
            childWidget: LoginForm(),
            heightW: heightScreen - 150,
            widthtW: widthScreen,
          ),
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

  Widget _header(BuildContext context) {
    final colorPrimary = Theme.of(context).primaryColor;
    final heigth = MediaQuery.of(context).size.height;
    return Container(
        color: colorPrimary,
        width: double.infinity,
        height: heigth / 2.5,
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'home');
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
          ],
        ));
  }

  Widget _formRegister(BuildContext context) {
    final registerUser = Provider.of<UserProvider>(context);

    final width = MediaQuery.of(context).size.width;
    final colorSecond = Theme.of(context).colorScheme.secondaryVariant;
    final colorPrimary = Theme.of(context).primaryColor;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(child: Container(height: 200.0)),
          Container(
            width: width * .85,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: colorSecond,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 3.0),
                    spreadRadius: 2.0,
                  )
                ]),
            child: Column(
              children: [
                Text(
                  'Registro',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0),
                ),
                TextFormField(
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Nombre',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Daniel',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                TextFormField(
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Apellido',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'García',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                TextFormField(
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Correo Electronico',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'correo_99@gmail.com',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                TextFormField(
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: '2435fdg65#',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                TextFormField(
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Repetir Contraseña',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: '2435fdg65%#',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Material(
                  color: colorPrimary,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    minWidth: width * .50,
                    onPressed: () async {
                      Navigator.pushNamed(context, 'home');
                      final user = await registerUser.registerUser();
                      print(user);
                    },
                    child: Text(
                      "Registrarse",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
