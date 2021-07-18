import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/user/providers/orders_provider.dart';

import 'package:ss_manager/src/widgets/bottom_nav_widge.dart';
import 'package:ss_manager/src/widgets/custom_widgets.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/widgets_body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).primaryColor;
    final colorAcent = Theme.of(context).colorScheme.primaryVariant;
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final order = Provider.of<OrderProvider>(context);

    return Material(
        child: WillPopScope(
            child: Stack(
              children: [
                _background(context),
                Column(
                  children: [
                    HeaderCustomWidget(
                      childWidget: Text(''),
                      heightW: 150.0,
                    ),
                    BodyCustomWidget(
                      childWidget: Text(''),
                      heightW: heightScreen - 150,
                      widthtW: widthScreen,
                    ),
                  ],
                ),
              ],
            ),
            onWillPop: () {
              return new Future(() => false);
            }));
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

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).colorScheme.secondaryVariant;

    return Container(
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: colorP,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          NameSection(
            textW: 'Ventas Recientes',
          )
        ],
      ),
    );
  }
}

class CardSaleToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final colorSecond2 = Theme.of(context).colorScheme.secondaryVariant;
    final colorP = Theme.of(context).primaryColor;

    return Container(
      height: 100.0,
      width: widthScreen * .95,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: colorSecond2,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5.0,
              offset: Offset(0.0, 3.0),
              spreadRadius: 2.0,
            )
          ]),
      child: Row(children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Vendido Hoy',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0),
              ),
              Text(
                "\$ 200.00",
                style: TextStyle(
                    color: colorP, fontWeight: FontWeight.w600, fontSize: 25.0),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
