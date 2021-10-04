import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/forms/login_form.dart';
import 'package:ss_manager/src/autenticacion/forms/register_form.dart';
import 'package:ss_manager/src/autenticacion/providers/autenticacion_provider.dart';
import 'package:ss_manager/src/utils/preferences_user.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';

import 'package:ss_manager/src/widgets/logo.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/utils_widgets.dart';
import 'package:ss_manager/src/widgets/widgets_body.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final colorP = Theme.of(context).primaryColor;
    final colorSecond = Theme.of(context).colorScheme.secondary;
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
            paddingW: EdgeInsets.only(top: 30.0, bottom: 30.0),
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
            textW: 'Registro por Email',
            childWidget: Text(''),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(child: RegisterForm())
        ],
      ),
    );
  }
}

class OptionRegister extends StatelessWidget {
  OptionRegister({Key? key, this.text, this.path, this.functionAction})
      : super(key: key);

  final path;
  final text;
  final functionAction;
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return TextButton(
        onPressed: functionAction,
        child: Container(
          width: widthScreen,
          height: 55.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 10.0,
                  spreadRadius: 5.0)
            ],
          ),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  child: Image.asset(path)),
              Text(
                text,
                style: TextStyle(color: Colors.grey, fontSize: 18.0),
              )
            ],
          ),
        ));
  }
}
