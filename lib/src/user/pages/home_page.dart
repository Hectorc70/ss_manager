import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/user/providers/orders_provider.dart';

import 'package:ss_manager/src/widgets/bottom_nav_widge.dart';
import 'package:ss_manager/src/widgets/custom_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).primaryColor;
    final colorAcent = Theme.of(context).colorScheme.primaryVariant;
    final width = MediaQuery.of(context).size.width;
    final order = Provider.of<OrderProvider>(context);

    return Material(
      child: WillPopScope(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 200),
              child: AppBarHomeCustom(),
            ),
            body: Stack(
              children: [
                Container(
                  color: colorP,
                ),
                BodyHome(),
              ],
            ),
            bottomNavigationBar: BottomNavBarCustom(),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                Navigator.of(context).pushReplacementNamed('NewSale');
              },
              elevation: 0.0,
              backgroundColor: colorP,
              child: Icon(
                Icons.add,
                color: colorAcent,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
          onWillPop: () {
            return new Future(() => false);
          }),
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
          _title(context),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        "Ventas Recientes",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20.0),
        textAlign: TextAlign.left,
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
