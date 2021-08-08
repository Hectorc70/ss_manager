import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/Manager_icons_.dart';
import 'package:ss_manager/src/user/forms/sale_form.dart';
import 'package:ss_manager/src/user/providers/sales_provider.dart';

import 'package:ss_manager/src/widgets/bottom_nav_widget.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/widgets_body.dart';

class NewSalePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).primaryColor;
    final colorAcent = Theme.of(context).colorScheme.primaryVariant;
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final order = Provider.of<SaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 100.0,
        title: Text('Hola Hector Bienvenido'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          _background(context),
          Expanded(
            child: BodyCustomWidget(
              childWidget: _Body(),
              heightW: heightScreen,
              widthtW: widthScreen,
              paddingW: EdgeInsets.all(35.0),
            ),
          )
        ],
      ),
    );
  }

  Widget _background(BuildContext context) {
    final colorP = Theme.of(context).colorScheme.primary;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: colorP),
    );
  }
}

class _Body extends StatelessWidget {
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
          NameSection(textW: 'Nueva Venta', childWidget: Text('')),
          SizedBox(
            height: 30.0,
          ),
          SaleForm()
        ],
      ),
    );
  }
}
