import 'package:flutter/material.dart';
import 'package:ss_manager/src/utils/preferences_user.dart';
import 'package:ss_manager/src/widgets/logo.dart';
import 'package:ss_manager/src/widgets/manager_icons_icons.dart';

class LateralMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final infoApp = Provider.of<AppInfo>(context);
    //final colorBackCard = Colors.red;
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final colorPrimary = Theme.of(context).primaryColor;
    final colorB = Color.fromRGBO(163, 136, 197, 1);
    return Drawer(
        elevation: 5.0,
        child: Column(children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              width: widthScreen,
              height: 140.0,
              color: colorPrimary,
              child: logoApp(context, Text('')),
            ),
          ),
          Expanded(
              child: ListView(children: [
            _opcionMenu(
                context, 'Cerrar Sesión', Icons.logout, colorB, _logout),
          ]))
        ]));
  }

  _logout(BuildContext context) {
    final prefs = PreferencesUser();
    prefs.removePrefsUser();
    Navigator.pushNamedAndRemoveUntil(
        context, 'typeLogin', (Route<dynamic> route) => false);
  }

  _opcionMenu(
      BuildContext context, String text, IconData icon, colorIcon, function) {
    final colorPrimary = Theme.of(context).primaryColor;
    final functionAction = function;
    return ListTile(
      leading: Icon(
        icon,
        color: colorIcon,
      ),
      title: Text(text,
          style: TextStyle(
              color: Colors.grey.shade700,
              fontFamily: 'Poppins',
              fontSize: 16.0,
              fontWeight: FontWeight.w400)),
      onTap: () {
        functionAction(context);
      },
    );
  }
}
