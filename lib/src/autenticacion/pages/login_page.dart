import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/forms/login_form.dart';
import 'package:ss_manager/src/autenticacion/forms/register_form.dart';
import 'package:ss_manager/src/autenticacion/providers/autenticacion_provider.dart';
import 'package:ss_manager/src/widgets/fields_widgets.dart';
import 'package:ss_manager/src/widgets/logo.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/widgets_body.dart';

class LoginPage extends StatelessWidget {
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
            textW: 'Login por Email',
            childWidget: Text(''),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(child: LoginForm())
        ],
      ),
    );
  }
}
